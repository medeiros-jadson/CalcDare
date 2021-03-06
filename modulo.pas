unit modulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet;

type
  Tdm = class(TDataModule)
    fd: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    tb_gridiva: TFDTable;
    queryIVACALC: TFDQuery;
    DS1: TDataSource;
    queryIVACALCidProduto: TIntegerField;
    queryIVACALCProduto: TStringField;
    queryIVACALCQuantidade: TSingleField;
    queryIVACALCValorUnitario: TSingleField;
    queryIVACALCValorTotal: TSingleField;
    queryIVACALCIcmsDest: TSingleField;
    queryIVACALCIcmsEmit: TSingleField;
    queryIVACALCIcmsEmitTotal: TSingleField;
    queryIVACALCIva: TSingleField;
    queryIVACALCIvaTotal: TSingleField;
    queryIVACALCIcmsDestTotal: TSingleField;
    queryIVACALCreduFarmaceutica: TSingleField;
    queryIVACALCreduCestaBasica: TSingleField;
    queryIVACALCStIva: TSingleField;
    queryIVACALCreduBebida: TSingleField;
    tb_gridivaidProduto: TIntegerField;
    tb_gridivaProduto: TStringField;
    tb_gridivaQuantidade: TSingleField;
    tb_gridivaValorUnitario: TSingleField;
    tb_gridivaValorTotal: TSingleField;
    tb_gridivaIcmsDest: TSingleField;
    tb_gridivaIcmsEmit: TSingleField;
    tb_gridivaIcmsEmitTotal: TSingleField;
    tb_gridivaIva: TSingleField;
    tb_gridivaIvaTotal: TSingleField;
    tb_gridivaIcmsDestTotal: TSingleField;
    tb_gridivareduFarmaceutica: TSingleField;
    tb_gridivareduCestaBasica: TSingleField;
    tb_gridivaStIva: TSingleField;
    tb_gridivareduBebida: TSingleField;
    queryLojas: TFDQuery;
    queryLojasidlojas: TFDAutoIncField;
    queryLojasnome: TStringField;
    queryLojasraz„oSocial: TStringField;
    queryLojascnpj: TStringField;
    tb_gridPauta: TFDTable;
    queryPAUTACALC: TFDQuery;
    DS2: TDataSource;
    queryPAUTACALCidProduto: TIntegerField;
    queryPAUTACALCProduto: TStringField;
    queryPAUTACALCQuantidade: TSingleField;
    queryPAUTACALCValorUnitario: TSingleField;
    queryPAUTACALCValorTotal: TSingleField;
    queryPAUTACALCIcmsEmit: TSingleField;
    queryPAUTACALCIcmsEmitTotal: TSingleField;
    queryPAUTACALCPauta: TSingleField;
    queryPAUTACALCPautaTotal: TSingleField;
    queryPAUTACALCIcmsDest: TSingleField;
    queryPAUTACALCIcmsDestTotal: TSingleField;
    queryPAUTACALCIcmsStTotal: TSingleField;
    queryPAUTACALCRedCestaBasica: TSingleField;
    queryPAUTACALCRedBebida: TSingleField;
    queryPAUTACALCValorDare: TSingleField;
    tb_gridPautaidProduto: TIntegerField;
    tb_gridPautaProduto: TStringField;
    tb_gridPautaQuantidade: TSingleField;
    tb_gridPautaValorUnitario: TSingleField;
    tb_gridPautaValorTotal: TSingleField;
    tb_gridPautaIcmsEmit: TSingleField;
    tb_gridPautaIcmsEmitTotal: TSingleField;
    tb_gridPautaPauta: TSingleField;
    tb_gridPautaPautaTotal: TSingleField;
    tb_gridPautaIcmsDest: TSingleField;
    tb_gridPautaIcmsDestTotal: TSingleField;
    tb_gridPautaIcmsStTotal: TSingleField;
    tb_gridPautaRedCestaBasica: TSingleField;
    tb_gridPautaRedBebida: TSingleField;
    tb_gridPautaValorDare: TSingleField;
    tb_dareiva: TFDTable;
    tb_darepauta: TFDTable;
    tb_dadosnfedare: TFDTable;
    queryDadosNfeDare: TFDQuery;
    tb_dareivaiddareiva: TFDAutoIncField;
    tb_dareivadanfeIVA: TStringField;
    tb_dareivachaveXMLIVA: TStringField;
    tb_dareivaproduto: TStringField;
    tb_dareivaquantidade: TIntegerField;
    tb_dareivavalorUnitario: TSingleField;
    tb_dareivavalorTotal: TSingleField;
    tb_dareivaicmsDest: TIntegerField;
    tb_dareivaicmsEmit: TIntegerField;
    tb_dareivabaseIcmsEmit: TSingleField;
    tb_dareivabaseIcmsDest: TSingleField;
    tb_dareivaiva: TSingleField;
    tb_dareivabaseIva: TSingleField;
    tb_dareivareduFarmaceutica: TSingleField;
    tb_dareivareduCestaBasica: TSingleField;
    tb_dareivareduBebida: TSingleField;
    tb_dareivavalorDare: TSingleField;
    tb_darepautaiddarepauta: TFDAutoIncField;
    tb_darepautadanfePAUTA: TStringField;
    tb_darepautachaveXMLPAUTA: TStringField;
    tb_darepautaproduto: TStringField;
    tb_darepautaquantidade: TIntegerField;
    tb_darepautavalorUnitario: TSingleField;
    tb_darepautavalorTotal: TSingleField;
    tb_darepautaicmsDest: TIntegerField;
    tb_darepautaicmsEmit: TIntegerField;
    tb_darepautabaseIcmsDest: TSingleField;
    tb_darepautabaseIcmsEmit: TSingleField;
    tb_darepautapauta: TSingleField;
    tb_darepautabasePauta: TSingleField;
    tb_darepautareduCestaBasica: TSingleField;
    tb_darepautareduBebida: TSingleField;
    tb_darepautacredEmitStDest: TSingleField;
    tb_darepautavalorDare: TSingleField;
    queryDareIva: TFDQuery;
    queryDarePauta: TFDQuery;
    queryDareIvaiddareiva: TFDAutoIncField;
    queryDareIvadanfeIVA: TStringField;
    queryDareIvachaveXMLIVA: TStringField;
    queryDareIvaproduto: TStringField;
    queryDareIvaquantidade: TIntegerField;
    queryDareIvavalorUnitario: TSingleField;
    queryDareIvavalorTotal: TSingleField;
    queryDareIvaicmsDest: TIntegerField;
    queryDareIvaicmsEmit: TIntegerField;
    queryDareIvabaseIcmsEmit: TSingleField;
    queryDareIvabaseIcmsDest: TSingleField;
    queryDareIvaiva: TSingleField;
    queryDareIvabaseIva: TSingleField;
    queryDareIvareduFarmaceutica: TSingleField;
    queryDareIvareduCestaBasica: TSingleField;
    queryDareIvareduBebida: TSingleField;
    queryDareIvavalorDare: TSingleField;
    queryDarePautaiddarepauta: TFDAutoIncField;
    queryDarePautadanfePAUTA: TStringField;
    queryDarePautachaveXMLPAUTA: TStringField;
    queryDarePautaproduto: TStringField;
    queryDarePautaquantidade: TIntegerField;
    queryDarePautavalorUnitario: TSingleField;
    queryDarePautavalorTotal: TSingleField;
    queryDarePautaicmsDest: TIntegerField;
    queryDarePautaicmsEmit: TIntegerField;
    queryDarePautabaseIcmsDest: TSingleField;
    queryDarePautabaseIcmsEmit: TSingleField;
    queryDarePautapauta: TSingleField;
    queryDarePautabasePauta: TSingleField;
    queryDarePautareduCestaBasica: TSingleField;
    queryDarePautareduBebida: TSingleField;
    queryDarePautacredEmitStDest: TSingleField;
    queryDarePautavalorDare: TSingleField;
    queryDadosNfeDaredanfe: TIntegerField;
    queryDadosNfeDarechaveXML: TStringField;
    queryDadosNfeDarefornecedor: TStringField;
    queryDadosNfeDarecnpjFornecedor: TStringField;
    queryDadosNfeDareieFornecedor: TStringField;
    queryDadosNfeDarecfop: TStringField;
    queryDadosNfeDareufEmitente: TStringField;
    queryDadosNfeDareufDestinatario: TStringField;
    queryDadosNfeDarerazaoSocialDestinatario: TStringField;
    queryDadosNfeDarecnpjDestinatario: TStringField;
    queryDadosNfeDareieDestinatario: TStringField;
    queryDadosNfeDaredataEmissaoDare: TDateField;
    queryDadosNfeDaredataVencimentoDare: TDateField;
    queryDadosNfeDareobservacao: TStringField;
    queryDadosNfeDaretotalDare: TSingleField;
    DS3: TDataSource;
    queryDadosNfeDaretotalBaseCalculo: TSingleField;
    queryDadosNfeDaretotalIcmsDestTotal: TSingleField;
    queryDadosNfeDaretotalCredIcmsEmit: TSingleField;
    queryDadosNfeDarestatus: TStringField;
    queryDadosNfeDarefecoep: TSingleField;
    tb_log: TFDTable;
    queryUsuario: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
    fd.Connected := True;
end;

end.
