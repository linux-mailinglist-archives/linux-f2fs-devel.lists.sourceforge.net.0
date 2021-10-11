Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCD2428CB4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Oct 2021 14:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aQUCu3pWaIxzfEufc/HuAPOKQVgmQJc4tTLe8EJygH8=; b=CBikSMa5LrcFeGdO5VDrBGW+E
	zFcZCQ3L9wQsvYDwQIi+KHP7Cjw7BihtfbL6lr08D8dREqItnW9OCQMvz1gRL4DKa7TRMDroAHY0Y
	0dj4F86+UNahpVEP3oVyQZy8zEjbp4mMKNGKdEqm60rAHgoeH29IX+2X5DeqrEzkrzJNk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mZu7s-0000ii-BV; Mon, 11 Oct 2021 12:09:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mZu7l-0000iU-Di
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Oct 2021 12:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QQRR21KjlaNuJog9sO5dUnebp05bntQ/h5tc6nNi5Fw=; b=IVfugZHYw68ZQtPZy+0OhqPoi7
 95WKilW5K2Q23vSgekLEVAb16Q9Pi3Ozm9K3c4Li/cHRBGT0ji2z84aUQrRbhBOHkiWCDt4eNNvbi
 XGkvilO4kxbx5fWGliNpdJhdmorjowov0BAayHXFOHRZNoxP8mo+UIEu9v6HfDnK4cuk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QQRR21KjlaNuJog9sO5dUnebp05bntQ/h5tc6nNi5Fw=; b=Ry79hjF7GmkbkHYaw2ZaT1O+1b
 SDSBgq7oT2cqSWoGi/oGZM057VcBkdEboMBvk7fJTqh9oz/+zAJu0qvYEMTznf4qs2xpIIs1LbuyB
 3+vxkrWSlex2EeIlFAAv3Qv+xRKlKFh/FgSIUwBDzRkTs/otn8s5olJEC/2VHx/gHRvs=;
Received: from mail-eopbgr1310132.outbound.protection.outlook.com
 ([40.107.131.132] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mZu7h-00049x-7Q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Oct 2021 12:09:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HU8KVxz3Nn1JEJI63UeBwM6PpeKr9oUeov2nMnC/ISVhZLwNC/As5TUbJ4is4zts7tSNxU3BgVB7qLooU5+orQdedQeyd4BdmwC02qzCSXOVg44mb8kGGNMEuH75ZAMFlngFMHmWiyfi8QH310TA82ex+WT25kkK1bGoCDZJ1SEvLAFVB+U5VJNdAYktB3gTXn35Ap7j/oY2lRuvYMTEaz5jyB6ykHSBwFxn2fzSOYEpbHyXCZwC2HXqPCC73pvFkXb+iEEbOuY/tE0JUQ72wXRKMLjkYjrtJkoSxl5t7Ha1cOOUmfJ6L9L9wJVPXQ2VSGdQV/eS3XoQkYvi0HwsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQRR21KjlaNuJog9sO5dUnebp05bntQ/h5tc6nNi5Fw=;
 b=fl+4uGpy+PMWuBvqy2BDrTaoNJubL2Soeg1WFwOGRMg90AYmp7+1bbnjQebycD6cckGI/Br2Ow4aMruLAzd/dyXWOXjdTkJ9B1IRvPzYSTjhqUPMlItI/SWmVJzaqf1f6Ffu68DGZ+7MV1TtV2Y+FIsOZ5cjpeOxuq4XFYfqSnOjCP9JuHeqtVbE5LZmlQx5RKSTC1hQ6NCf3IHORuTl7SH3YQXk7xXr8iUDWuqArs+XabywmY5zFosDuJI2wDGpzsrBu9uBbvW+ISRzDA2DLnpr3EFhl29ECBqB1YySowzZSJWitXNr0LD1aWGScCitq3tbQGS06jNdUNIeI+RSjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQRR21KjlaNuJog9sO5dUnebp05bntQ/h5tc6nNi5Fw=;
 b=gA+TunJINra3K7c3iNJXOX6LeGc7LenZm/m9JhYTbh5JmA0z1N5TsdbQ8zeCj2FLgoKFf17UQmEYDJ6DqA4qAp9828HNoBt9J/xSO186sICjC6QKM+z1R4AIiEfDMxg3K6IYHomXK209hICV2QGTAvmLEuexpT29jT5prS9X+XU=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4228.apcprd06.prod.outlook.com (2603:1096:820:79::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 12:09:33 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f448:2382:12d4:b8f3]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f448:2382:12d4:b8f3%5]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 12:09:33 +0000
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
Thread-Topic: [PATCH] f2fs: compress: fix overwrite may reduce compress ratio
 unproperly
Thread-Index: AQHXvpgWimRhkChGdU+E+fTsdswNKqvNs6mg
Date: Mon, 11 Oct 2021 12:09:33 +0000
Message-ID: <KL1PR0601MB40035DD05949F6324B0D10E5BBB59@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211011120356.300261-1-changfengnan@vivo.com>
In-Reply-To: <20211011120356.300261-1-changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5903afe-c6b0-45f5-5a57-08d98caffcaf
x-ms-traffictypediagnostic: KL1PR0601MB4228:
x-microsoft-antispam-prvs: <KL1PR0601MB422815088FA2F72E5097E85CBBB59@KL1PR0601MB4228.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:163;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T1CN/sUqVPLJgG869lmEZIcL4gBhDZHMBzaOG/UeSLutMwV8bP2T5CbIIys3iVshPMuszEAY+ycLO/gxZdymL2uCiS+h2Sk4/B/b4wA95dql2pLJ/z70HU4vvJZ/oqLMaLJi0rakTIlEiGR8wbtDp1LRCRUWDbb8ZfmGPomsxcPt9NlN+p4OwbQ1PjvL4buXbx24VgWKE5Vx5/XDZwdQlue6f3TKqR1Tt0MtqwEZ75/cESM+aFRy7kxHMijjiDPBrZdrVnL2V9qvaMPBZssTpTremP9/M8ObZGu1no880vcCK4kRbbZvw7xOH2NmJAXSalzG9EiHNH98e5A7Sf9OnsqXnItSzBu+OLvymnd7t0b7YbKgOERdfNZ3bm0lLnlkH914p2Z7dnbj6NNiVDyg05K6UPWfMwNWKSyxFle8WDXC3gIASlRE/YUsxH8n7uaUaxof8n9ZnIbvq3JQ8gIBMmHoVvb8IUK/KwAGfFZTMw05WiEhhBtbTyTEN0ra2GDEYZ15OXIaLzC5kQXlUTar8PkWUK27ZmSM5wwzZt6sQ4B/M8zBev0xPKfN/NFCy1GDe2I8UjFsC4ujMNBts6CeJnjlDeXjDwmFVe9U4Vjk9fkNL0ISCbVpzTMvmuGFINBvEeyaUy+Qqr72CxEnqRPwlBAgWUcZ9dkVtq2dH7BgSfIfxb2B/VwCIXXjjhFRzpP/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(2906002)(66476007)(64756008)(8676002)(53546011)(66946007)(110136005)(52536014)(38100700002)(76116006)(122000001)(66446008)(85182001)(186003)(7696005)(6506007)(33656002)(4326008)(55016002)(26005)(9686003)(71200400001)(5660300002)(508600001)(38070700005)(19627235002)(8936002)(86362001)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?YjBhbEE2WTk2NWUycUgrMkRvM0ZnZnAvL0ZaMnRJMmxMcHFEZmRwK21XaVhN?=
 =?gb2312?B?RHFWMUtOWWtoNGlQblQ1cUROUXdmdVcvSjJRRmpYU3psMUc3NGhGOHgvQXZH?=
 =?gb2312?B?SEZIWXBPUi9BNW05RHN3cXlpVFh0eHZxNm42NnJqeHZ5VEFDYkUzU2JMbTJK?=
 =?gb2312?B?TERyWHppSVVIUzUvZW8yOFAzN2cydS9xWkhua1NqRk5nOHVHa1VKcXZRWjdo?=
 =?gb2312?B?dkYvRndFcUh5UFlzSk9tbERYYWgzeGNBWCt3cEpDUnAzNHgxRkdpME9vc3Y2?=
 =?gb2312?B?c3RxaURwNWVRc3h4SXBQWXFnV3lkZXpaWWlnQ2ROUy9kak8vZDVlVmtlODRs?=
 =?gb2312?B?VWV2U1I4WHVSeXVDTXZranY0WWlvczdjbEZhQlp4aEV2bTNqNUJrNERWMytr?=
 =?gb2312?B?WFd2NEpZRjdsZnhwdjMxb1VtNnFBT1UxSmZXVURpVXRQM1llaG5xY050RXdX?=
 =?gb2312?B?c0lTeGxXSzM1VHZoNEwxWFAxa242VEgxQnRaZHoyTW1vTjhsY1JIb0ZtM0x6?=
 =?gb2312?B?UE1JZzNBcGVEZ2ZOKzJLQk9LVWpvakNMNHNkb1VmeExVRWYyenduM3dXVGlX?=
 =?gb2312?B?TDRxZmJSbzl0VHRMRXRNakVUOVdzVGpCaUtHRWpuTExnNzNNMzNRb3dxYnB3?=
 =?gb2312?B?UlVkUE5hMDNoM25EZTM0Unc5SFE4eDlkY2l0akhnODBtbTJWUjJpWnZVdzJ3?=
 =?gb2312?B?U3N4N2Iya3VpQll4M3UvZXZKMXRucW1ONEEzNHoyc0pwdTl3TjgvSG8zSDRK?=
 =?gb2312?B?M1FpRTRBY0gwb1BZUHF4ZVNWWThsazEwLzFNdnZ1ZzF2VExLSXhlNXlZUFdP?=
 =?gb2312?B?YjBIb1V5ZFRtem91M2FmdUt6RmZmdTFIWG1hRjI4aVNVMWJYVDJ5RmcxM25r?=
 =?gb2312?B?cURucitvYjV6MUVvZmY4ZEVVeWZRUEZheFJjN2w2bEVXUnBlSzRmYWxBdTVp?=
 =?gb2312?B?TFpLanFNbncxbmVMbHM1WDhoT2RTc0xXa0JkUFRBa1FFNUxKZm9nYmx6M2pL?=
 =?gb2312?B?WFlCSWJYaFpkTWU2TngyaGhtcHNsTDR1bUwyYkRkVVhSNWtaSmVoVUd3UlYr?=
 =?gb2312?B?OGg3Vi85d21yYkFneXIrYUV3aWlZdXpvZTIxQ3BFbnhya21TQXpJOHd0MUFw?=
 =?gb2312?B?SmgxdDNQdzBmbHBMTW5hVjZGR09NRzVuT20vWFAwNHJUeE1pTWpmNmI3MkMy?=
 =?gb2312?B?bXlXSkVFWTBObFFnZ3JzbmIveUw1enZ4NzQxWHJzNEJtMU9aN3VJZFN6dFV2?=
 =?gb2312?B?d2R0YkZHTXQ3Vk96aFJBSGp3VGs2VXFKZ3NRNWpXeVA3WUxNbjYvV0lINFRy?=
 =?gb2312?B?bzlWQW9adk1ULzNTZDBUNjVUanFuRWpXUURrbkRxRFRkK3ZlWXRQZ3FvSU5m?=
 =?gb2312?B?c211c0FFZGtsRW52aU1OUGNmSm9EaTlLbXNQVVpZaXZrVjFRdTkyZ0t4ZVVF?=
 =?gb2312?B?aDMyanBmV1lRbk1LNFg2OHdEdWsrKzV1WlV6bnYzY2lPVC9GTGkrMjZjeFNQ?=
 =?gb2312?B?VkJia1dwd0JwU2M5bkZHcklwSEdCS2tWRzFZYkd0S3dJbnRpTWhXOGRsVkhn?=
 =?gb2312?B?OHBGTW5iYlJ2QnNyVWttL1dvbGNpdzBhQkJ1VjFKV2tTc3JUdGdpbE0wRFNG?=
 =?gb2312?B?TWwxMWVRU2R3Tjk3NHE1Y2phWE9KaCtVZ3FPRFJ5bVFlT0RGMHZTcFBsYWwv?=
 =?gb2312?B?RkhLQzJ4SkN6ZmZEZDN0QmRDdngxTEsxQW10eEl3RDRzOVZyKzZ5VDB3TUli?=
 =?gb2312?Q?MtrU9HvUXq0WryLrmE=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5903afe-c6b0-45f5-5a57-08d98caffcaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 12:09:33.3582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mistgLy2tvHaTcXBxCa8MBlR5GTnz0dteF+/0Vuz5UQ3OMEgoIXV1YfRHhAjCld1vCS5JXyItuOz/CviUUs4Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4228
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch may will make random write bench score reduce a
 lot. In my test, use fio test randwrite, config as below: [global] direct=1
 numjobs=1 time_based runtime=60 ioengine=sync iodepth=16 filename [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.132 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.131.132 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mZu7h-00049x-7Q
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix overwrite may reduce
 compress ratio unproperly
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
From: =?gb2312?B?s6O37+mq?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?gb2312?B?s6O37+mq?= <changfengnan@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhpcyBwYXRjaCBtYXkgd2lsbCBtYWtlIHJhbmRvbSB3cml0ZSBiZW5jaCBzY29yZSByZWR1Y2Ug
YSBsb3QuDQpJbiBteSB0ZXN0LCB1c2UgZmlvIHRlc3QgcmFuZHdyaXRlLCBjb25maWcgYXMgYmVs
b3c6DQpbZ2xvYmFsXQ0KZGlyZWN0PTENCm51bWpvYnM9MQ0KdGltZV9iYXNlZA0KcnVudGltZT02
MA0KaW9lbmdpbmU9c3luYw0KaW9kZXB0aD0xNg0KZmlsZW5hbWU9ZmlvLXRlc3QNCmJ1ZmZlcl9w
YXR0ZXJuPTB4MDAwMDAwDQoNCltmaWxlNV0NCm5hbWU9ZmlvLXJhbmQtd3JpdGUNCnJ3PXJhbmR3
cml0ZQ0KYnM9NEsNCnNpemU9MTI4TQ0KDQp3L28gcGF0Y2g6DQpXUklURTogYnc9MTIuNU1pQi9z
ICgxMy4xTUIvcyksIDEyLjVNaUIvcy0xMi41TWlCL3MgKDEzLjFNQi9zLTEzLjFNQi9zKSwgaW89
NzUwTWlCICg3ODdNQiksIHJ1bj02MDAwMS02MDAwMW1zZWMNCncvIHBhdGNoOg0KV1JJVEU6IGJ3
PTU4MjNLaUIvcyAoNTk2M2tCL3MpLCA1ODIzS2lCL3MtNTgyM0tpQi9zICg1OTYza0Ivcy01OTYz
a0IvcyksIGlvPTM0MU1pQiAoMzU4TUIpLCBydW49NjAwMDEtNjAwMDFtc2VjDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogs6O37+mqDQo+IFNlbnQ6IE1vbmRheSwgT2N0
b2JlciAxMSwgMjAyMSA4OjA0IFBNDQo+IFRvOiBqYWVnZXVrQGtlcm5lbC5vcmc7IGNoYW9Aa2Vy
bmVsLm9yZw0KPiBDYzogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7ILOj
t+/pqg0KPiA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGYyZnM6
IGNvbXByZXNzOiBmaXggb3ZlcndyaXRlIG1heSByZWR1Y2UgY29tcHJlc3MgcmF0aW8NCj4gdW5w
cm9wZXJseQ0KPiANCj4gd2hlbiBvdmVyd3JpdGUgb25seSBmaXJzdCBibG9jayBvZiBjbHVzdGVy
LCBzaW5jZSBjbHVzdGVyIGlzIG5vdCBmdWxsLCBpdCB3aWxsIGNhbGwNCj4gZjJmc193cml0ZV9y
YXdfcGFnZXMgd2hlbiBmMmZzX3dyaXRlX211bHRpX3BhZ2VzLCBhbmQgY2F1c2UgdGhlIHdob2xl
DQo+IGNsdXN0ZXIgYmVjb21lIHVuY29tcHJlc3NlZCBldmVudGhvdWdoIGRhdGEgY2FuIGJlIGNv
bXByZXNzZWQuDQo+IHRoaXMgbWF5IHdpbGwgbWFrZSByYW5kb20gd3JpdGUgYmVuY2ggc2NvcmUg
cmVkdWNlIGEgbG90Lg0KPiANCj4gcm9vdCMgZGQgaWY9L2Rldi96ZXJvIG9mPS4vZmlvLXRlc3Qg
YnM9MU0gY291bnQ9MQ0KPiANCj4gcm9vdCMgc3luYw0KPiANCj4gcm9vdCMgZWNobyAzID4gL3By
b2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzDQo+IA0KPiByb290IyBmMmZzX2lvIGdldF9jYmxvY2tzIC4v
ZmlvLXRlc3QNCj4gDQo+IHJvb3QjIGRkIGlmPS9kZXYvemVybyBvZj0uL2Zpby10ZXN0IGJzPTRL
IGNvdW50PTEgb2ZsYWc9ZGlyZWN0IGNvbnY9bm90cnVuYw0KPiANCj4gdy9vIHBhdGNoOg0KPiBy
b290IyBmMmZzX2lvIGdldF9jYmxvY2tzIC4vZmlvLXRlc3QNCj4gMTg5DQo+IA0KPiB3LyBwYXRj
aDoNCj4gcm9vdCMgZjJmc19pbyBnZXRfY2Jsb2NrcyAuL2Zpby10ZXN0DQo+IDE5Mg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogRmVuZ25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPg0KPiAt
LS0NCj4gIGZzL2YyZnMvZGF0YS5jIHwgMyArKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0
YS5jIGluZGV4IGY0ZmQ2YzI0NmM5YS4uMjY3ZGI1ZDM5OTNlDQo+IDEwMDY0NA0KPiAtLS0gYS9m
cy9mMmZzL2RhdGEuYw0KPiArKysgYi9mcy9mMmZzL2RhdGEuYw0KPiBAQCAtMzAyNSw2ICszMDI1
LDkgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKHN0cnVjdA0KPiBhZGRyZXNz
X3NwYWNlICptYXBwaW5nLA0KPiAgCQkJCQkJCQkxKSkgew0KPiAgCQkJCQkJcmV0cnkgPSAxOw0K
PiAgCQkJCQkJYnJlYWs7DQo+ICsJCQkJCX0gZWxzZSBpZiAocmV0MiAmJiBucl9wYWdlcyAtIGkg
PCBjYy5jbHVzdGVyX3NpemUpIHsNCj4gKwkJCQkJCXJldHJ5ID0gMTsNCj4gKwkJCQkJCWJyZWFr
Ow0KPiAgCQkJCQl9DQo+ICAJCQkJfSBlbHNlIHsNCj4gIAkJCQkJZ290byBsb2NrX3BhZ2U7DQo+
IC0tDQo+IDIuMzIuMA0KDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
