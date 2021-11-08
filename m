Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B0C447C62
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Nov 2021 09:57:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mk0Sp-0006py-CA; Mon, 08 Nov 2021 08:57:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mk0Sn-0006pr-Sz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Nov 2021 08:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=shc0Prl0S0IGW7Wr5MxuqC7fGZ55hKK6V1as44qDBDw=; b=XEwigKOHxcqy9umMVDy0t8o3Dw
 MD8eQt32NaUeBIGl0VewR8bnlvf4v+GBLBVgq13SblNnYTaffLaVd8rh1C8+M5pXpNK3bP7I3X30j
 xHcVhmkxf9DhVnELmHtqFwSsM2QAACOQ4PjW5UcMuqeTSwUDUM5rSackSKrWGYqMYglA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=shc0Prl0S0IGW7Wr5MxuqC7fGZ55hKK6V1as44qDBDw=; b=G1TW6M15NtZYv5M13tNqyvJ/gD
 6gvBAyT/Sv3O4Nw5o82nKZ0vi3y2VjFgAccntbvfDJ13sDLJxQ+5CkOOZIuIsRaBFrfJrdjphulTu
 Pktg6KwdN0Zo8bjyGRcQLcoVWhlblSvJVBhHijx/wwiO2SfJ7nB7gD4+BqsVaMvH1NN4=;
Received: from mail-eopbgr1320091.outbound.protection.outlook.com
 ([40.107.132.91] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mk0Sl-005rvW-0E
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Nov 2021 08:57:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPYLNZPFaA3oev/OKPsS/nmNl1Gnppw9JE+zZYMuWocj8VUO3zbcRbugNFdlHR5eFFVsTX/ktcCe5l0MhFsxooyA/I0plhuqiGWqYqSI4uG2Kq05yCr0MVr1ayrhZs+pBSQPN98uF6hiG5yfMO0XsAEwWn3gQRlZuitMrDkxHgPL+NTmxQFlMjHlDNRpe7Bn6ICk94XUGaqjdrdEOUsAKysevA5GjBp8oS/s6y/bzbBs1s9qObo3Cl0dyiQGSYgDA1cMXNnvqjIUEr4vDh7ZYF2xHQRUatZC172LgOfGAQnmDMcp9hEXtlc2Rqql0j44ppGLKOXLgDoqb1GuhhoJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shc0Prl0S0IGW7Wr5MxuqC7fGZ55hKK6V1as44qDBDw=;
 b=Two0kfJaPHb1vMwO/kKFnlATPt2cxBfFo3gO/A2zdDO+SY8vTY1yE3l34qWcHS2mYfa2BWUwuYzv/NCS90Ym3VEyl8BbZGeQqkcIdiLxDEhJLKg6suCNR3/IFoijNia4A9G46sRq06O1L0cAVSoxWprRw8l0ixh8EZvMuey2aIPiv93011l48Gfw75jL8JmKIDr0/Tlp/BMR3A2vP855McWGfG+oFWBSz2scUPvxdEBM5ITFtIlP5FW9wO81MUtXdLosa8NTsPwwPpgFnQypeZkld6yctB7MIrU7NnRPClNX8v2ZvViLAQshJAXQFCP8qOoF7W3gGIWzmj5pQ8cVRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shc0Prl0S0IGW7Wr5MxuqC7fGZ55hKK6V1as44qDBDw=;
 b=H/0omYVHttuhW79XlLsBuPUhfmi0pJary+1UBgx2cGvdUYc73EXi+qZtDpxAJrwgdg2nQhbBYK2NnEBua8DTg7kH4uGlX/fJmJEDyWtKxTsHaKGKxFk2KiogcuNhXkCMTFVQ1sXFTJmc5518NtcAMrXlqDjIzAd06XUFv62vA8g=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB1974.apcprd06.prod.outlook.com (2603:1096:802:b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Mon, 8 Nov
 2021 08:56:56 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%6]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 08:56:56 +0000
From: =?gb2312?B?s6O37+mq?= <changfengnan@vivo.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
Thread-Topic: Do we need serial io for compress file?
Thread-Index: AQHX1FRqrNmTjuyOY0ChZa278NHys6v5UtHQ
Date: Mon, 8 Nov 2021 08:56:55 +0000
Message-ID: <KL1PR0601MB4003615E989DEFDE86793B58BB919@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211108035459.40139-1-changfengnan@vivo.com>
In-Reply-To: <20211108035459.40139-1-changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2221bde-6a3b-4242-fe61-08d9a295b7a1
x-ms-traffictypediagnostic: KL1PR0601MB1974:
x-microsoft-antispam-prvs: <KL1PR0601MB19749E015DF7B6FD42B0BA09BB919@KL1PR0601MB1974.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:316;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RjDMMAZcNCP1ITTm16I2onrV042CUDiOBUW5BmsA/GktEMPwE2HZSYmOtTrawllzd6sRtJv9wYQ8HaA3sta+5My8lu0/i4Hpls/SCJoVY5z4svI5oyt/jgdzWUCynKvG0MPiA4bzBFeSt3HlB3gUcu4SAHZw33xCc+UnLn2K3g/+3mF2lu4//whD2mgcV7TzEVy4hAzWbC7KXKiQ5uZXUd2pYmpyUnJr8hseWI4xnv7PzAnTp9beRROeB+VsrY8dtzxG+Bez0f0ZAv2yNpAj074o8MwhUb6qXbMdvYCIOk6pYDrPQpwDey50vHfScYZwWZFSvEdjZop69Jpxkrb3hEJaheolGPvzu8o1pRakGv0js335vHkZHitYE6rMq2R5TH/W5rBynUbVo7mEvN7vZ6kmn6PQqOEcTqyOQt40ZFWc3m2ZvVesgVf2XM1RiKtB8wWZSayYMw6rAkpDR79mbZwEdFOpwi834FNFnOopTQVlNgmT7n0isdGjx7RCTEJmt+uJ0fPGZr2WfTCUThGx+VM1fKDez2fP/cmkzDmogDVo8769jwWHKY9vnhvBx2ZZGVE9iRm2735IcDTsQMtLsigWZnyM63gOB7emGdCiLe/ilrpU3fcOwYgewogk/HY7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(110136005)(38070700005)(26005)(4326008)(76116006)(66476007)(66946007)(66446008)(66556008)(64756008)(5660300002)(508600001)(33656002)(85182001)(8936002)(2906002)(7696005)(122000001)(6506007)(186003)(86362001)(53546011)(8676002)(52536014)(55016002)(38100700002)(9686003)(83380400001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?dGVHa2FrVjNuZkwxOU5KOTQzcEpBY2QzejgzS3RCOFlpN0lJdDNWKzFLanB1?=
 =?gb2312?B?Zy9yU0p0dk9rRHBJeDVOOWRRU3gxRC9QS2N3Mms0M2xmWVV1ZlBwUm1JNGtn?=
 =?gb2312?B?KzQ5UXQ0QmthVW1KajA2eEd3cTgvV0gyRFB6WmdoMXpUSm5PaDRnWkVwR3Iw?=
 =?gb2312?B?Y0pNUzBsWWRaTW9JU1RnOWtrSUg2YlZQNm95WnNFQUlJRGpDMXk4WUhlSTZJ?=
 =?gb2312?B?cE0xVXoxZ21pbHNGZEF0bTVYeEwzY3NqVnVCeEpCcDBmNk96b3dmd3dwSHJH?=
 =?gb2312?B?bVdCa2xacFNnSTZzampQV2daUHlkWVdPV3QxR1Erc3VySUhBM05NcFdKSG1z?=
 =?gb2312?B?RTNzVDhXY0orRmVkRkFUajU3WnVrM3NkMVZON2hkWXdkRGZpb2RienRIOVNI?=
 =?gb2312?B?cVREWjBZMEZabUNjYmVuampQK2UwNHV4Wk5Bd2ZIVUtudE8rSnorM1ZTdHhv?=
 =?gb2312?B?T0hKNDI5TFFHYWhEb0dkZGRXRFJ0eVB5THJHb0JGVU1NUFJOTzE1RklubTdo?=
 =?gb2312?B?eGRrbEZVMTV5UlhhOTFDczRRdk1HZVRES2hPQVFNbHBNeXg0YmZKRXA3QjNv?=
 =?gb2312?B?ZEJlUDN0YTBVUXBxLzZmVFBrRlh1L056NUVHTGNBblNCaDMxQlBMb0RpWHo0?=
 =?gb2312?B?TGhZUjJLY0YrNlRvSUJhWHJrMDBjNC9YNXlvYjJZcVhaV2xnT0I2c2V5bDZM?=
 =?gb2312?B?MkROWFJzZWVSQjVJaitRcGNqeFZ1Vms1SjZ1S2JqVGpxK2FpME92a3p1OFc3?=
 =?gb2312?B?Mk84aXJlUXFCWGJRUnhxR256Um9PTWhvdVpRL0dRcVFleExTTWQyN1dFbmto?=
 =?gb2312?B?TSsrUVdUQU9MZ1BGTXhlRnZsYWQyK05DTEFYdG9uT1c3SnBURHVxQmZiNEgv?=
 =?gb2312?B?QWlRa0dpWDFqSU9IWk90Vy9nZzhONUFJQ0toREVKbU84NnJQLzkwVEVhM3JE?=
 =?gb2312?B?cmdBMGxDVExZTmNBRzJvSGgxK21wNTVsNFlmalpoTTQ5UDR4UkxrbFVQdlBo?=
 =?gb2312?B?N0pzR2F5d2hwamxyaDNVdE1kRVF2em1PU09VYzRUaXJRUllaaml3bDFkZzla?=
 =?gb2312?B?dlE2OUdkektiQmJVMDJJMFg4b2ZzQXN0QmdNa3hlbWVWbDh3TEhWcXlVT0NX?=
 =?gb2312?B?V013UjMrb0pIaHB4R3JINzJCUi9BdGl5Rytoc1ozNmNLWnJUQkllOXZSaWNX?=
 =?gb2312?B?eU5uaHBQWERWOWE4YndEaFJIbHc4WlhhMzlCbjZYWnhWWFdHT0lrMWNpSUN5?=
 =?gb2312?B?TXUyNjMrRlYvam92eDlpK1pxd1FTMHRxeUFraS9PRlBUK1FiUjVpNzhtb3pk?=
 =?gb2312?Q?pv/uYW6YuqcqWAZSnIEA5hOJM5YYJUZzGY?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2221bde-6a3b-4242-fe61-08d9a295b7a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2021 08:56:55.9719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UQVyXIXM8/Z0Gpw792CF7G8FHALHdA0tqaxpH9WsH9gSGNfXl+/GPnLSpZTqlqPFYlYxByG55JlcIz/gLSB6Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB1974
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Anyway, I did some modify to verify my idea, and did some
 test,
 not found problem for now. The modify as follows: diff --git a/fs/f2fs/data.c
 b/fs/f2fs/data.c index f4fd6c246c9a..0ed677efe820 100644 --- a/fs/f2fs/data.c
 +++ b/fs/f2fs/data.c @@ -3165, 8 +3165,
 6 @@ static inline bool __should_serialize_io(struct ino [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.132.91 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.91 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mk0Sl-005rvW-0E
Subject: Re: [f2fs-dev] Do we need serial io for compress file?
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QW55d2F5LCBJIGRpZCBzb21lIG1vZGlmeSB0byB2ZXJpZnkgbXkgaWRlYSwgYW5kIGRpZCBzb21l
IHRlc3QsIG5vdCBmb3VuZCBwcm9ibGVtIGZvciBub3cuDQoNClRoZSBtb2RpZnkgYXMgZm9sbG93
czoNCg0KZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMNCmluZGV4
IGY0ZmQ2YzI0NmM5YS4uMGVkNjc3ZWZlODIwIDEwMDY0NA0KLS0tIGEvZnMvZjJmcy9kYXRhLmMN
CisrKyBiL2ZzL2YyZnMvZGF0YS5jDQpAQCAtMzE2NSw4ICszMTY1LDYgQEAgc3RhdGljIGlubGlu
ZSBib29sIF9fc2hvdWxkX3NlcmlhbGl6ZV9pbyhzdHJ1Y3QgaW5vZGUgKmlub2RlLA0KIAlpZiAo
SVNfTk9RVU9UQShpbm9kZSkpDQogCQlyZXR1cm4gZmFsc2U7DQogDQotCWlmIChmMmZzX25lZWRf
Y29tcHJlc3NfZGF0YShpbm9kZSkpDQotCQlyZXR1cm4gdHJ1ZTsNCiAJaWYgKHdiYy0+c3luY19t
b2RlICE9IFdCX1NZTkNfQUxMKQ0KIAkJcmV0dXJuIHRydWU7DQogCWlmIChnZXRfZGlydHlfcGFn
ZXMoaW5vZGUpID49IFNNX0koRjJGU19JX1NCKGlub2RlKSktPm1pbl9zZXFfYmxvY2tzKQ0KQEAg
LTMyMTgsMTEgKzMyMTYsMTYgQEAgc3RhdGljIGludCBfX2YyZnNfd3JpdGVfZGF0YV9wYWdlcyhz
dHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywNCiAJCW11dGV4X2xvY2soJnNiaS0+d3JpdGVw
YWdlcyk7DQogCQlsb2NrZWQgPSB0cnVlOw0KIAl9DQorCWlmIChmMmZzX25lZWRfY29tcHJlc3Nf
ZGF0YShpbm9kZSkpDQorCQltdXRleF9sb2NrKCYoRjJGU19JKGlub2RlKS0+Y29tcHJlc3NfbG9j
aykpOw0KIA0KIAlibGtfc3RhcnRfcGx1ZygmcGx1Zyk7DQogCXJldCA9IGYyZnNfd3JpdGVfY2Fj
aGVfcGFnZXMobWFwcGluZywgd2JjLCBpb190eXBlKTsNCiAJYmxrX2ZpbmlzaF9wbHVnKCZwbHVn
KTsNCiANCisJaWYgKGYyZnNfbmVlZF9jb21wcmVzc19kYXRhKGlub2RlKSkNCisJCW11dGV4X3Vu
bG9jaygmKEYyRlNfSShpbm9kZSktPmNvbXByZXNzX2xvY2spKTsNCisNCiAJaWYgKGxvY2tlZCkN
CiAJCW11dGV4X3VubG9jaygmc2JpLT53cml0ZXBhZ2VzKTsNCiANCmRpZmYgLS1naXQgYS9mcy9m
MmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oDQppbmRleCAwMzlhMjI5ZTExYzkuLjNhNjU4N2Yx
M2QyZiAxMDA2NDQNCi0tLSBhL2ZzL2YyZnMvZjJmcy5oDQorKysgYi9mcy9mMmZzL2YyZnMuaA0K
QEAgLTc2Myw2ICs3NjMsNyBAQCBzdHJ1Y3QgZjJmc19pbm9kZV9pbmZvIHsNCiAJc3RydWN0IGxp
c3RfaGVhZCBpbm1lbV9wYWdlczsJLyogaW5tZW1vcnkgcGFnZXMgbWFuYWdlZCBieSBmMmZzICov
DQogCXN0cnVjdCB0YXNrX3N0cnVjdCAqaW5tZW1fdGFzazsJLyogc3RvcmUgaW5tZW1vcnkgdGFz
ayAqLw0KIAlzdHJ1Y3QgbXV0ZXggaW5tZW1fbG9jazsJLyogbG9jayBmb3IgaW5tZW1vcnkgcGFn
ZXMgKi8NCisJc3RydWN0IG11dGV4IGNvbXByZXNzX2xvY2s7CS8qIGxvY2sgZm9yIGNvbXByZXNz
IGZpbGUgKi8NCiAJc3RydWN0IGV4dGVudF90cmVlICpleHRlbnRfdHJlZTsJLyogY2FjaGVkIGV4
dGVudF90cmVlIGVudHJ5ICovDQogDQogCS8qIGF2b2lkIHJhY2luZyBiZXR3ZWVuIGZvcmVncm91
bmQgb3AgYW5kIGdjICovDQpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9z
dXBlci5jDQppbmRleCBhMTMzOTMyMzMzYzUuLjg1NjZlOWMzNDU0MCAxMDA2NDQNCi0tLSBhL2Zz
L2YyZnMvc3VwZXIuYw0KKysrIGIvZnMvZjJmcy9zdXBlci5jDQpAQCAtMTMyMyw2ICsxMzIzLDcg
QEAgc3RhdGljIHN0cnVjdCBpbm9kZSAqZjJmc19hbGxvY19pbm9kZShzdHJ1Y3Qgc3VwZXJfYmxv
Y2sgKnNiKQ0KIAlJTklUX0xJU1RfSEVBRCgmZmktPmlubWVtX2lsaXN0KTsNCiAJSU5JVF9MSVNU
X0hFQUQoJmZpLT5pbm1lbV9wYWdlcyk7DQogCW11dGV4X2luaXQoJmZpLT5pbm1lbV9sb2NrKTsN
CisJbXV0ZXhfaW5pdCgmZmktPmNvbXByZXNzX2xvY2spOw0KIAlpbml0X3J3c2VtKCZmaS0+aV9n
Y19yd3NlbVtSRUFEXSk7DQogCWluaXRfcndzZW0oJmZpLT5pX2djX3J3c2VtW1dSSVRFXSk7DQog
CWluaXRfcndzZW0oJmZpLT5pX3hhdHRyX3NlbSk7DQotLQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206ILOjt+/pqg0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDgsIDIw
MjEgMTE6NTUgQU0NCj4gVG86IGphZWdldWtAa2VybmVsLm9yZzsgY2hhb0BrZXJuZWwub3JnDQo+
IENjOiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldA0KPiBTdWJqZWN0OiBE
byB3ZSBuZWVkIHNlcmlhbCBpbyBmb3IgY29tcHJlc3MgZmlsZT8NCj4gDQo+IEluIG15IHRlc3Qs
IHNlcmlhbCBpbyBmb3IgY29tcHJlc3MgZmlsZSB3aWxsIG1ha2UgbXVsdGl0aHJlYWQgc21hbGwg
d3JpdGUNCj4gcGVyZm9ybWFuY2UgZHJvcCBhIGxvdC4NCj4gDQo+IEknbSB0cnkgdG8gZmluZ3Vy
ZSBvdXQgd2h5IHdlIG5lZWQgX19zaG91bGRfc2VyaWFsaXplX2lvLCBJTU8sIHdlIHVzZQ0KPiBf
X3Nob3VsZF9zZXJpYWxpemVfaW8gdG8gYXZvaWQgZGVhZGxvY2sgb3IgdHJ5IHRvIGltcHJvdmUg
c2VxdWVudGlhbA0KPiBwZXJmb3JtYW5jZSwgYnV0IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgd2Ug
c2hvdWxkIGRvIHRoaXMgZm9yIGNvbXByZXNzZWQNCj4gZmlsZS4gSW4gbXkgdGVzdCwgaWYgd2Ug
anVzdCByZW1vdmUgdGhpcywgd3JpdGUgc2FtZSBmaWxlIGluIG11bHRpdGhyZWFkIHdpbGwgaGF2
ZQ0KPiBwcm9ibGVtLCBidXQgcGFyYWxsZWwgd3JpdGUgZGlmZmVyZW50IGZpbGVzIGluIG11bHRp
dGhyZWFkIGlzIG9rLiBTbyBJIHRoaW5rDQo+IG1heWJlIHdlIHNob3VsZCB1c2UgYW5vdGhlciBs
b2NrIHRvIGFsbG93IHdyaXRlIGRpZmZlcmVudCBmaWxlcyBpbg0KPiBtdWx0aXRocmVhZC4NCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
