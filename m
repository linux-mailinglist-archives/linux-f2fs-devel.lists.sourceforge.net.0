Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B5340F5C6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Sep 2021 12:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NFtfMCwEICguvZRQxIeBwcjMe3uL5jF9f4UeDZddr/M=; b=M/hRtqHsip7PsxCai2PXin5ja
	JTb2IEI6D6rzROeEA8y80H04q4fw9dGX7kWj/qmCRo3x2ASaqR/WS6FinC11LYoF2/VqOkqZjKGa5
	zKXxhof92InY82tEpGc6Wq2B+IIJjKMYZeWUMWiZ5ig8fy5uMKEEPlUH89A7VFWEMBSKc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mRAyc-0001ng-1a; Fri, 17 Sep 2021 10:20:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mRAyb-0001nQ-5G
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Sep 2021 10:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t4LwCwj+UDf3xfWoVpZnZat/Sot4kja+pu3y/4uPBw0=; b=cBw9VexlJWT7rHxdHnxVmbQfeH
 0QksOd4jl/OC0LtQH2MDZlux3BqRzq8sdBxcSDWCkXFl6mJs97FLIHCszI8mWnuVfgDkoxISGx0N/
 rWD8jcJ8302cpgH7306e5iQfq3yAB1rFznGx9gD8KO+lhD7fMrsMR3FSSerRDJLb99Ic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t4LwCwj+UDf3xfWoVpZnZat/Sot4kja+pu3y/4uPBw0=; b=LCBLHo0LupCYPpliu1WsdEirx6
 +V+PRuF0m116GJp3LwrkVI+0Z2yFu1VSxel6MvArNL76iNKCxAH1HlfOK3yGF+UKOBEuUOcUKZlgC
 8FJ1PZMzUWO2y7cTkwZvQE3hZ+k3tQKT+K33tfzRQZP2Mg5nrCpAMR6CbagTXanoUqNI=;
Received: from mail-eopbgr1300122.outbound.protection.outlook.com
 ([40.107.130.122] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mRAyT-0008Fa-7Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Sep 2021 10:20:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkwCuG38nnh5glI713wJt4INePlm0M3UxssNan/X/NYAD1Fj3jmr2eA2/NcM/xrcGFfjvDRzxFWACNGf//bFOI57grVnCZCw7QbI7QQ5kIFVV17Tdh6SBsPC8iFn2b9NrjBQdCSjZXlmO9Y2JWADDFUkCV67ZDt15FaUnGwy5SwS1K/ec9n/f1YhR6b1NUHyt3mzcAezjPwJzDxLg/laGqdfLL4gBqCK/l5OqSNFFku40U+oPN3evvKS0ANsAchThUig3HfudSY3C+dK10fzHWqrb9otujiR4/Iy3v1Ah0ETFQMflcatUocRqF03oJ/DlShLMFEsORtlMIOpPQpO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=t4LwCwj+UDf3xfWoVpZnZat/Sot4kja+pu3y/4uPBw0=;
 b=Re72uOYg76UsJ5UrI69CL69W5kq5EubU3cqqZZENSVruhaoZSzgCHFi8bEigwwgj5EpmVAK2KtISe6qXZMR85mrw4m7NATrGN81JT/RHGAZDN5v+A++fG3H7OBlu4zT2/HQVzwliCeoF++6RbVDoTQClTeOAip14+rCbmk8OVEO1jXryRV5/XuYec+AqI82Rn+jaQxhhbH8MQN3abvCJ1ZOuSonBPdYtVUm2VTum2SByRB55qCqGtPc/DojxVoiFF3eB0uDZx/pJkR1TvYI0iYHGnfRilpq0+Bw3VAfzFeeP591h61nvXkfQSqdZ63J38LPr0hlT8D5Fiux5IlNgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4LwCwj+UDf3xfWoVpZnZat/Sot4kja+pu3y/4uPBw0=;
 b=CUz/2qfZ4w6Jm2HiIGWqUoI+vULB2iWeA+rY862bZHDQFLXCHoR2DcN2nVgpcUoVQPSf3MQzu2sjmDA7T1L7jf1SHMSnnpQEXsccja7siZ2Ttzxms/eE9OIJ/1c04iiqx72TLe8oZc7tQLYOIT19ZXB6T4BYo5BCLwwcIgCvHV0=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB1879.apcprd06.prod.outlook.com (2603:1096:802:8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 10:19:52 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970%7]) with mapi id 15.20.4523.017; Fri, 17 Sep 2021
 10:19:52 +0000
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2 2/2] f2fs: fix missing inplace count in overwrite with
 direct io
Thread-Index: AQHXqu5PjxLZ5rWf40GUlvKwiLN686umkaiAgAAJteCAAWQ9YA==
Date: Fri, 17 Sep 2021 10:19:51 +0000
Message-ID: <KL1PR0601MB40030D121F65550D690A776DBBDD9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20210916113026.378385-1-changfengnan@vivo.com>
 <20210916113026.378385-2-changfengnan@vivo.com>
 <AFQA*QDoEjqpHYJlWwMYT4qj.9.1631794201010.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB400388BC823D5FD0558D43D2BBDC9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
In-Reply-To: <KL1PR0601MB400388BC823D5FD0558D43D2BBDC9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee5e1acc-8d4c-479b-7b63-08d979c4b001
x-ms-traffictypediagnostic: KL1PR0601MB1879:
x-microsoft-antispam-prvs: <KL1PR0601MB18798EA05BCAF7A76735EE57BBDD9@KL1PR0601MB1879.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7wuleSPTJoSXHUrLMyNzSgJA0JM8DnXrPUn8nOMUirugV84C+Cq2jQfUgZJfK5Qkn2x7CspCDxa3myE9kfmSSTi5D+StYdYEKWwoUOpyalHrkP2AQGjOuG3YfTyjYA3/fBqBQPzqvwiCbDv0u0bWUQ4rZzoRdMt8m4fEV68PNSkvy+W41zk3HTn+hTGaK+5c/ParkOPI7SfoIV2+mOoIjKAuRLip8I8RZV/DkC3SDlCxMKF9zC6VYLwodqph3LrkwSzAGweg5Am5YexAHrXf38TkBRHlHSnGtwD0JGK7TV8rpkPNGGUrsbNz9ouL2t1OvqfH4C2dSJDPt1cezp88CizEZrP6kCFaauEne0gGe0644SE/RL/U0ciKghr0WVqmAPk1EcBEhq+AsxYYinpR7uSBXfiV1beXJkH78qC2Jasfqyf8IPsDqsfrwgQSM50nCf5FL8vy10qOu2x1Idq9PlzhoDK2OtwVbyx/FV2PYR6WmPOBYq6o6ReEwYxY7QcgmpUgsiZgyOVj/j/DxkkH6t1UqAKJe+Pccs48hIhncN3vB1VfiH73A2h9IzGRzdaELLLuNlu5jr/INOYt2T1zqwznn560b50IKDsUPF7yMCxVQLMKFsbY1sBpc/i84OvAk0AUnvg8QSCmAlMdxTHP+/yTBhkGVG3Ng8bOp7t2GIKkLy93CWcGBXexdxpvTCDH0ypl95EFypXp5N0FG4Ny2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(2906002)(5660300002)(64756008)(478600001)(316002)(26005)(8936002)(38100700002)(38070700005)(76116006)(122000001)(85182001)(186003)(71200400001)(9686003)(7696005)(4326008)(83380400001)(8676002)(53546011)(33656002)(86362001)(6506007)(66556008)(66446008)(66946007)(110136005)(55016002)(52536014)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEZFZFZod1FGNVBveTZlTVR0U1BQZjJtd2JvS2c0dVJ6RU9QT1Vpejh2VlUw?=
 =?utf-8?B?Z2krdndBL2NkUGRpdGRjV3BHZEZCVmVGRVpNMCtaVFZ1dzJDUHNyM2FBYnhU?=
 =?utf-8?B?dkpiOXBBN3UvT3ZNQ1BOdGJUNkRROVhDNXdwZW14V0JURzJmUzRlYTVnd0hy?=
 =?utf-8?B?SVZsYmFlYWR1aVFxY3pVeHV4ZWtseXJmTGZaRFo2Vis4NWF1NFgxODR2RSs0?=
 =?utf-8?B?dlAxbFI4K2NENW1YeEF0SXNCeEpEWStKU1FRdDFpeVNpY3ZEQ0F4Nk1wSXVv?=
 =?utf-8?B?RUwxQ0Uxa3QrZFB2dnQ2VlphWms2MDRPbXJtd25YRHliWFgyR0hqZkVsTGZu?=
 =?utf-8?B?SkRNMDdyTDZiRTlmdzhscmMvOWExZUhsUUwwYUdNV1pGeDF1dHlFU0FvWnFh?=
 =?utf-8?B?U2x5MVIvZHpBdWNmck5xVG1WemFCZHExOC9sK1M0OUc2eVllRVlLcTFYbTNG?=
 =?utf-8?B?RDJJdUFNaVE3aDd6NUZCVTB2VEhCR0pYdXNMM2dRK1ZOVmRuZm5PU3NTRmlr?=
 =?utf-8?B?bWRxMUVHbUxsN0hQT3pvLzRBWkhZcS93MnFmRWoxV2Rpcjk1VU9DVzh4U0tY?=
 =?utf-8?B?OWZjZHNjemFvblVIYlhNdWM0T0ZvOTkrZGdjbGhreGRjMHl1ZTRTSGl6bCs0?=
 =?utf-8?B?Z3JQdmFZZ3U3VHM3Y2VEbWlpcDUzenZ6U2grbjVIK0VoOFMyV05rMWcvSkVx?=
 =?utf-8?B?Q1pCYlNBMmw5VUFjK0I1RENLOFhCbG1EZnk2Kyt5NWJHaUEvU0lJU0NrWDY5?=
 =?utf-8?B?a2I1ZHE1UVgrR3dJNCsxcEpUTWRualE4eWx6QlZyaUZUVDBkRDNHaU91bXpI?=
 =?utf-8?B?Y1kxczdKRllqUHBJK0lOb2dsbzA1MHgzQjRySG1zZ3ZiL0I2SmltQk5nWGcy?=
 =?utf-8?B?WGpKRU9hSUpPTzBsSFZVMi9URFNmK0JzeWZjWEFCZXVqMHdHMmsrWUFQcHJW?=
 =?utf-8?B?R081SFdRUjlLQUVMdWVQK0ZJYk52N1Yzb0NqYTJhcUs1a0oyR2tNUXhlRDRv?=
 =?utf-8?B?cEJDdDA2emFXL2lXZGg4MnlDZzQvREZCNkNRZ0JDTzlESkExcHZvMjk0QThX?=
 =?utf-8?B?eVNqTEp5dFdrVFkxQmVXZUZoQXlKQkVRQ2lNN2RaMVdWL0VoaXdEeVM2T2d5?=
 =?utf-8?B?azdCNkhOODlUZjBndVoyNERTVW1ERENDVnNhVkpvM3g1ZE91SDJkcXdaYU1J?=
 =?utf-8?B?NjJOc0VRUHNJLzRtemJKVWw4ZE1xSnRLakZobGEwMlA4TXYrdG9HbTJ5V21B?=
 =?utf-8?B?T2lob3dMdWIvK1orK2g1KzZxcE9ucFRJL3VzQk5LWGxjREFaY3NCaldaNEtJ?=
 =?utf-8?B?S0dsRFdRMWJJdVBVc2VWRHJVUlB0R2V4NXFpd1NERjNKOVUzZStwU2hhL0M2?=
 =?utf-8?B?Vy9landhenRFMEhpbUxGV3RHbktoM0NFb3o5MkpoTldqTDYvblVGZEg1b3RS?=
 =?utf-8?B?b2h3WWp3OWJHOTc3VHNwMGVhYmZqVlJGb2FLTDBpZjFiQ1BxUWF2T1o4R0pJ?=
 =?utf-8?B?aXNHQ2xpM3hCWmU2OWtINk9obGhybjZiZ05xVjZheGJUeUZSc0dka0RkbTYx?=
 =?utf-8?B?MXNmV1FGcWQwVXBWeFQ0ZEJybWpReWVFeWtFTFR3bmRKbzk0SWVLYitkaFRE?=
 =?utf-8?B?UU9CVUF3VkJ1RFhYbkVXZDZmVHF1MUpsZEtmbGhCWmhtSUE3TXZxbkt3eExq?=
 =?utf-8?B?V25iaFdybklSeGFzRUlza1VkeHhHNkdSMXBWc3FYTFhtdmVyaUJsM25UT0cw?=
 =?utf-8?Q?fLEXu5CV2vkGHHQR14=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5e1acc-8d4c-479b-7b63-08d979c4b001
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2021 10:19:51.9011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vpK1xEQZ6mNzucNiIIZbVfY4RBnsQaAxwjId4tOwcsBd5hNtlY9Nv9VPctunvB9i+VKi/5O0J97hzVobKrJYbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB1879
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.122 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.122 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mRAyT-0008Fa-7Q
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: =?utf-8?B?5bi45Yek5qWg?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog5bi45Yek5qWgDQo+IFNl
bnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTYsIDIwMjEgODo0NiBQTQ0KPiBUbzogQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPjsgamFlZ2V1a0BrZXJuZWwub3JnDQo+IENjOiBsaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldA0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHYyIDIvMl0g
ZjJmczogZml4IG1pc3NpbmcgaW5wbGFjZSBjb3VudCBpbiBvdmVyd3JpdGUgd2l0aA0KPiBkaXJl
Y3QgaW8NCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZy
b206IGNoYW5nZmVuZ25hbkB2aXZvLmNvbSA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPiBPbiBCZWhh
bGYgT2YNCj4gQ2hhbw0KPiA+IFl1DQo+ID4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxNiwg
MjAyMSA4OjEwIFBNDQo+ID4gVG86IOW4uOWHpOaloCA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPjsg
amFlZ2V1a0BrZXJuZWwub3JnDQo+ID4gQ2M6IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIGYyZnM6IGZpeCBtaXNz
aW5nIGlucGxhY2UgY291bnQgaW4NCj4gPiBvdmVyd3JpdGUgd2l0aCBkaXJlY3QgaW8NCj4gPg0K
PiA+IE9uIDIwMjEvOS8xNiAxOTozMCwgRmVuZ25hbiBDaGFuZyB3cm90ZToNCj4gPiA+IEZvciBu
b3csIG92ZXJ3cml0ZSBmaWxlIHdpdGggZGlyZWN0IGlvIHVzZSBpbnBsYWNlIHBvbGljeSwgYnV0
IG5vdA0KPiA+ID4gY291bnRlZCwgZml4IGl0LiBBbmQgdXNlIHN0YXRfYWRkX2lucGxhY2VfYmxv
Y2tzKHNiaSwgMSwgKSBpbnN0ZWFkDQo+ID4gPiBvZiBzdGF0X2luY19pbnBsYWNlX2Jsb2Nrcyhz
YiwgKS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2Zl
bmduYW5Adml2by5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAgZnMvZjJmcy9kYXRhLmMgICAgfCA3
ICsrKysrKy0NCj4gPiA+ICAgZnMvZjJmcy9mMmZzLmggICAgfCA4ICsrKystLS0tDQo+ID4gPiAg
IGZzL2YyZnMvc2VnbWVudC5jIHwgMiArLQ0KPiA+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMgaW5kZXgNCj4gPiA+IGMxNDkwYjlhMTM0NS4u
MGM1NzI4ZDYzYzMzIDEwMDY0NA0KPiA+ID4gLS0tIGEvZnMvZjJmcy9kYXRhLmMNCj4gPiA+ICsr
KyBiL2ZzL2YyZnMvZGF0YS5jDQo+ID4gPiBAQCAtMTQ5MSw2ICsxNDkxLDkgQEAgaW50IGYyZnNf
bWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLA0KPiA+ID4gc3RydWN0DQo+ID4gZjJmc19t
YXBfYmxvY2tzICptYXAsDQo+ID4gPiAgIAkJaWYgKGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfRElP
KQ0KPiA+ID4gICAJCQlmMmZzX3dhaXRfb25fYmxvY2tfd3JpdGViYWNrX3JhbmdlKGlub2RlLA0K
PiA+ID4gICAJCQkJCQltYXAtPm1fcGJsaywgbWFwLT5tX2xlbik7DQo+ID4gPiArCQlpZiAoIWYy
ZnNfbGZzX21vZGUoc2JpKSAmJiBmbGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTyAmJg0KPiA+ID4g
KwkJCQltYXAtPm1fbWF5X2NyZWF0ZSkNCj4gPiA+ICsJCQlzdGF0X2FkZF9pbnBsYWNlX2Jsb2Nr
cyhzYmksIG1hcC0+bV9sZW4sIHRydWUpOw0KPiA+ID4gICAJCWdvdG8gb3V0Ow0KPiA+ID4gICAJ
fQ0KPiA+ID4NCj4gPiA+IEBAIC0xNTUzLDcgKzE1NTYsOSBAQCBpbnQgZjJmc19tYXBfYmxvY2tz
KHN0cnVjdCBpbm9kZSAqaW5vZGUsDQo+ID4gPiBzdHJ1Y3QNCj4gPiBmMmZzX21hcF9ibG9ja3Mg
Km1hcCwNCj4gPiA+ICAgCQkJCWdvdG8gc3luY19vdXQ7DQo+ID4gPiAgIAkJCWJsa2FkZHIgPSBk
bi5kYXRhX2Jsa2FkZHI7DQo+ID4gPiAgIAkJCXNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9BUFBF
TkRfV1JJVEUpOw0KPiA+ID4gLQkJfQ0KPiA+ID4gKwkJfSBlbHNlIGlmICghY3JlYXRlICYmICFm
MmZzX2xmc19tb2RlKHNiaSkgJiYgZmxhZyA9PQ0KPiA+IEYyRlNfR0VUX0JMT0NLX0RJTyAmJg0K
PiA+ID4gKwkJCQltYXAtPm1fbWF5X2NyZWF0ZSkNCj4gPg0KPiA+IFdoeSBub3QNCj4gPg0KPiA+
IH0gZWxzZSBpZiB7IWYyZnNfbGZzX21vZGUoc2JpKSAmJiBmbGFnID09IEYyRlNfR0VUX0JMT0NL
X0RJTyAmJg0KPiA+IAkJCQkJbWFwLT5tX21heV9jcmVhdGUpDQo+ID4NCj4gDQo+IFlvdSBhcmUg
cmlnaHQsIG5vIG5lZWQgdG8gY2hlY2sgY3JlYXRlIC4NCj4gDQpUaGVyZSBpcyBhIHByb2JsZW0g
aGVyZSwgaWYgcmVtb3ZlIGNyZWF0ZSBjaGVjaywgd2hlbiBjcmVhdGUgZmlsZSBhbmQgd3JpdGUg
d2l0aCBkaXJlY3QgaW8sDQpJdCB3aWxsIGNvdW50IGluIExGUyBhbmQgSVBVIGJvdGgsIGJlY2F1
c2UgcHJlYWxsb2NhdGUgYmxvY2sgYWRkciBmaXJzdC4gU28sIFdlIHN0aWxsIG5lZWQgY2hlY2sN
CmNyZWF0ZS4gDQpBbSBJIHJpZ2h0Pw0KDQpUaGFua3MuDQoNCj4gVGhhbmtzLg0KPiA+IFRoYW5r
cywNCj4gPg0KPiA+ID4gKwkJCXN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgMSwgdHJ1ZSk7
DQo+ID4gPiAgIAl9IGVsc2Ugew0KPiA+ID4gICAJCWlmIChjcmVhdGUpIHsNCj4gPiA+ICAgCQkJ
aWYgKHVubGlrZWx5KGYyZnNfY3BfZXJyb3Ioc2JpKSkpIHsgZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
ZjJmcy5oDQo+ID4gPiBiL2ZzL2YyZnMvZjJmcy5oIGluZGV4IDNkNGVlNDQ0ZGIyNy4uMmQ4MWU5
ZjBhMGVlIDEwMDY0NA0KPiA+ID4gLS0tIGEvZnMvZjJmcy9mMmZzLmgNCj4gPiA+ICsrKyBiL2Zz
L2YyZnMvZjJmcy5oDQo+ID4gPiBAQCAtMzc4NSwxMiArMzc4NSwxMiBAQCBzdGF0aWMgaW5saW5l
IHN0cnVjdCBmMmZzX3N0YXRfaW5mbw0KPiA+ICpGMkZTX1NUQVQoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpKQ0KPiA+ID4gICAJCWVsc2UJCQkJCQkJCVwNCj4gPiA+ICAgCQkJKChzYmkpLT5ibG9j
a19jb3VudFsxXVsoY3Vyc2VnKS0+YWxsb2NfdHlwZV0rKyk7CVwNCj4gPiA+ICAgCX0gd2hpbGUg
KDApDQo+ID4gPiAtI2RlZmluZSBzdGF0X2luY19pbnBsYWNlX2Jsb2NrcyhzYmksIGRpcmVjdF9p
bykJCQkJCVwNCj4gPiA+ICsjZGVmaW5lIHN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgY291
bnQsIGRpcmVjdF9pbykJCQlcDQo+ID4gPiAgIAlkbyB7CQkJCQkJCQlcDQo+ID4gPiAgIAkJaWYg
KGRpcmVjdF9pbykJCQkJCQlcDQo+ID4gPiAtCQkJKGF0b21pY19pbmMoJihzYmkpLT5pbnBsYWNl
X2NvdW50WzBdKSk7CQlcDQo+ID4gPiArCQkJKGF0b21pY19hZGQoY291bnQsICYoc2JpKS0+aW5w
bGFjZV9jb3VudFswXSkpOyAgXA0KPiA+ID4gICAJCWVsc2UJCQkJCQkJCVwNCj4gPiA+IC0JCQko
YXRvbWljX2luYygmKHNiaSktPmlucGxhY2VfY291bnRbMV0pKTsJCVwNCj4gPiA+ICsJCQkoYXRv
bWljX2FkZChjb3VudCwgJihzYmkpLT5pbnBsYWNlX2NvdW50WzFdKSk7CVwNCj4gPiA+ICAgCX0g
d2hpbGUgKDApDQo+ID4gPiAgICNkZWZpbmUgc3RhdF91cGRhdGVfbWF4X2F0b21pY193cml0ZShp
bm9kZSkJCQkJXA0KPiA+ID4gICAJZG8gewkJCQkJCQkJXA0KPiA+ID4gQEAgLTM4NzcsNyArMzg3
Nyw3IEBAIHZvaWQgZjJmc191cGRhdGVfc2l0X2luZm8oc3RydWN0IGYyZnNfc2JfaW5mbw0KPiA+
ICpzYmkpOw0KPiA+ID4gICAjZGVmaW5lIHN0YXRfaW5jX21ldGFfY291bnQoc2JpLCBibGthZGRy
KQkJZG8geyB9IHdoaWxlICgwKQ0KPiA+ID4gICAjZGVmaW5lIHN0YXRfaW5jX3NlZ190eXBlKHNi
aSwgY3Vyc2VnKQkJCWRvIHsgfSB3aGlsZSAoMCkNCj4gPiA+ICAgI2RlZmluZSBzdGF0X2luY19i
bG9ja19jb3VudChzYmksIGN1cnNlZykJCWRvIHsgfSB3aGlsZSAoMCkNCj4gPiA+IC0jZGVmaW5l
IHN0YXRfaW5jX2lucGxhY2VfYmxvY2tzKHNiaSkJCQlkbyB7IH0gd2hpbGUgKDApDQo+ID4gPiAr
I2RlZmluZSBzdGF0X2FkZF9pbnBsYWNlX2Jsb2NrcyhzYmksIGNvdW50LCBkaXJlY3RfaW8pCQlk
byB7IH0gd2hpbGUNCj4gPiAoMCkNCj4gPiA+ICAgI2RlZmluZSBzdGF0X2luY19zZWdfY291bnQo
c2JpLCB0eXBlLCBnY190eXBlKQkJZG8geyB9IHdoaWxlICgwKQ0KPiA+ID4gICAjZGVmaW5lIHN0
YXRfaW5jX3RvdF9ibGtfY291bnQoc2ksIGJsa3MpCQlkbyB7IH0gd2hpbGUgKDApDQo+ID4gPiAg
ICNkZWZpbmUgc3RhdF9pbmNfZGF0YV9ibGtfY291bnQoc2JpLCBibGtzLCBnY190eXBlKQlkbyB7
IH0gd2hpbGUgKDApDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9m
MmZzL3NlZ21lbnQuYyBpbmRleA0KPiA+ID4gZGVkNzQ0ZTg4MGQwLi5jNTQyYzRiNjg3Y2EgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYw0KPiA+ID4gKysrIGIvZnMvZjJmcy9z
ZWdtZW50LmMNCj4gPiA+IEBAIC0zNjExLDcgKzM2MTEsNyBAQCBpbnQgZjJmc19pbnBsYWNlX3dy
aXRlX2RhdGEoc3RydWN0DQo+ID4gPiBmMmZzX2lvX2luZm8NCj4gPiAqZmlvKQ0KPiA+ID4gICAJ
CWdvdG8gZHJvcF9iaW87DQo+ID4gPiAgIAl9DQo+ID4gPg0KPiA+ID4gLQlzdGF0X2luY19pbnBs
YWNlX2Jsb2NrcyhmaW8tPnNiaSwgZmFsc2UpOw0KPiA+ID4gKwlzdGF0X2FkZF9pbnBsYWNlX2Js
b2NrcyhzYmksIDEsIGZhbHNlKTsNCj4gPiA+DQo+ID4gPiAgIAlpZiAoZmlvLT5iaW8gJiYgIShT
TV9JKHNiaSktPmlwdV9wb2xpY3kgJiAoMSA8PA0KPiBGMkZTX0lQVV9OT0NBQ0hFKSkpDQo+ID4g
PiAgIAkJZXJyID0gZjJmc19tZXJnZV9wYWdlX2JpbyhmaW8pOw0KPiA+ID4NCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
