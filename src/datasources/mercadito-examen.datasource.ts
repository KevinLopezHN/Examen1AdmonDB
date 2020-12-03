import {inject, lifeCycleObserver, LifeCycleObserver} from '@loopback/core';
import {juggler} from '@loopback/repository';

const config = {
  name: 'MercaditoExamen',
  connector: 'mssql',
  url: 'mssql://KevinLopez_SQLLogin_1:2aclv4wehi@Mercadito.mssql.somee.com/Mercadito',
  host: 'Mercadito.mssql.somee.com',
  port: 1433,
  user: 'KevinLopez_SQLLogin_1',
  password: '2aclv4wehi',
  database: 'Mercadito'
};

// Observe application's life cycle to disconnect the datasource when
// application is stopped. This allows the application to be shut down
// gracefully. The `stop()` method is inherited from `juggler.DataSource`.
// Learn more at https://loopback.io/doc/en/lb4/Life-cycle.html
@lifeCycleObserver('datasource')
export class MercaditoExamenDataSource extends juggler.DataSource
  implements LifeCycleObserver {
  static dataSourceName = 'MercaditoExamen';
  static readonly defaultConfig = config;

  constructor(
    @inject('datasources.config.MercaditoExamen', {optional: true})
    dsConfig: object = config,
  ) {
    super(dsConfig);
  }
}
