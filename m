Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDE3ABF714
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 May 2025 16:06:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8svXzD57ZIlubMhkSHcjDqfyZQpqOGPdGzdxvLy9QY=; b=i8P4W39dFnucyOUoBvPzymlwWr
	9CZzgRiGcv1TSYU01U+SYOKPjOhzUPu9MqEcQEWxTtoRuKWqLxm7/9uqzsCkbW2LyFb91iU1hrA2v
	nkHzkEPHErYGb78uv2GftnZqhw/zQUSgDmAM5qwY02l8eP1coU4j8LprAfkyKZVk0vkc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uHk53-0000T1-Lh;
	Wed, 21 May 2025 14:06:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1uHk50-0000So-Vj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 14:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BO2dSEvuFTbd6rf+hIJIQeio+uEeKbGDIlLFu2qyfzY=; b=R6qinNIvHYOA8umYVfM6IeKWnk
 2pEAz1zzo3d1hXlWGX0gPKO7W0UmkQbrM/ddFuQTSDknehojNyPxPpyIyQM5oQn3imJmNQTOygHVj
 KJLEi5IrNT+5qUzQgTPaDcrjeGpWZxJWizocJTerMeYOoWw7TXKQLn0RAxJYfLtzOj2k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BO2dSEvuFTbd6rf+hIJIQeio+uEeKbGDIlLFu2qyfzY=; b=QfODZ3rjeNyYCS1YErdEb9lFTd
 ZHBAXE82o2h7/TeFBS2aefhzqbo3mlkcfG++yncRgzuTLAPfr3kTR5AULGx2HP5pQxQdV3ZX+1bNx
 /tY0uJVlHUIjsgZZSObSU34Za2FpqGsiwojGI+Vq0Sk3aKQXzvgETPfFG3zgtYM3ETqA=;
Received: from mail-eastasiaazon11011014.outbound.protection.outlook.com
 ([52.101.129.14] helo=HK3PR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uHk4z-0004Tu-Vz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 14:05:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTWxX28pDQmMP0t5ay+aiQfVBIW8jqtppRgWBcv0pc7bHglMJo0RGqXkegLRat8r/WC4vbEA+a5jBH/e1KPPV8eR3fwDE5boRD58xoda6AjZyNOEcqdDxR4LFoKVAyiO/75E5pT3jI7tZpqXHMvrB8C4rVIsO0YrkviuRUKEkQc6g6DNQzvlJXMMfMgMwbK+gaBrwlEL+OtDtP3/lFNuhIefSZjQEcH+M04Qvgo/n1EEj7ankuhxNorCNG6gsloJCGpJrhhHO7r2gXroapGVYaytxYDd2JAdFHmslKjJozz0jnGoKNKFwXDjCYRZWDp9XH1BkbhYMRB4kskvMbBERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BO2dSEvuFTbd6rf+hIJIQeio+uEeKbGDIlLFu2qyfzY=;
 b=bjW1EhekFZr+HoEvXuW5cgGVUnZtgDy5/Xf4SeQAEvTC8LVu5JFi9VYiLCCsPhq9dKTmmV21jS1Sj2bufNkfghVGvpQMdhEr471NiMXvkn7hsDHzHcy2wDxeGCbvnm/OJzroz/BZQX3xiAwwW/9vgCEp08MRfAAiIYV3tllGAT6cQPyX4jX6v3OUKtckGbe8jSmU3+yUM2c234nxbwaWwoJDjuZ7HfGYIdfSZrnkDinqPRed9bI6l9uN6E4+/0a7gmHEiNsysK+fsw37YUU9KCPkHSaspwvqqp34pKcA+slvul67x14etbbq+J/ib7yB/iFu7YTgGynDYjFxBjWk9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BO2dSEvuFTbd6rf+hIJIQeio+uEeKbGDIlLFu2qyfzY=;
 b=d71iW5hSi7VsTgWlTxxOhC4HUxnNTKJXVgNKkiM4lbHGqPy0oQo0ypmo/6tp9R17a8qp5oBClIF32g6o/rkvJxSaznCNJUfIJ+yBjVcJm4xkh0U3Lr7Hft7vFwbiHzLCEU2Xl+1JvV8lzfEbtKM0045oHlLGOtd0+fJWFJwRcmVApQyak4I90LWrywmi2w7nFgyZljiYS6IqhB3rxJWCmUCrdNED0VOM4XbHq3mqx9wOEt0dVowvNCBtFL6VIymJy9xwDmar7Rcsyflqr4zcVtIF9tNNN90ggxjqAYU2LmyHhRgyLCq3aBb+pbVbbNm8AMNAV9u4UwBzotxf2c+IbA==
Received: from TY1PPF33E28B4E6.apcprd06.prod.outlook.com (2603:1096:408::90e)
 by SEZPR06MB6232.apcprd06.prod.outlook.com (2603:1096:101:f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 14:05:46 +0000
Received: from TY1PPF33E28B4E6.apcprd06.prod.outlook.com
 ([fe80::a0e8:c3a8:8f3f:825c]) by TY1PPF33E28B4E6.apcprd06.prod.outlook.com
 ([fe80::a0e8:c3a8:8f3f:825c%5]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 14:05:46 +0000
To: Chunhai Guo <guochunhai@vivo.com>, Chao Yu <chao@kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH 2/2] f2fs: fix missing small discard in fstrim
Thread-Index: AQHbXPyFfMz9pllsAEKjnLK2f7mTm7MEZ0GAgAA5BICA2VinAA==
Date: Wed, 21 May 2025 14:05:46 +0000
Message-ID: <cef78061-4860-47e2-a06f-2fc13ccf0aff@vivo.com>
References: <20250102101310.580277-1-guochunhai@vivo.com>
 <20250102101310.580277-2-guochunhai@vivo.com>
 <b3f919fe-35a0-4253-91e9-fac8666bfbe2@kernel.org>
 <fd75a391-3dd1-4411-806e-0bbb363fcba3@vivo.com>
In-Reply-To: <fd75a391-3dd1-4411-806e-0bbb363fcba3@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY1PPF33E28B4E6:EE_|SEZPR06MB6232:EE_
x-ms-office365-filtering-correlation-id: 29ee6285-9cae-4565-bfa4-08dd98709542
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QVN0TmF0eGF2VVduczFuZGR6c2hBU3VnVCtjUy9Ya0RFNkpsZUpIVS9icWtW?=
 =?utf-8?B?K3lFUDAxSGVEbkF1MFdRRzdZTTFpcFdZcEcyZmpzczZEdWo3K3ZHRFVLcWV2?=
 =?utf-8?B?alVPV3ltNW9GbXBMdkNOdWljbGV2Y2U2ZWkraTJTVDNyV3FQb01ERDNweGVs?=
 =?utf-8?B?N2lVMHJQNmJ5TTV4amQ0M1RrcUtyWEpYZU5ld3NhZFhaN0VIeTB5WDZja0Nk?=
 =?utf-8?B?NXJWQlBLSnVlZWxVU0tJVmFDRlhvVGlYR3ltTzhqVG9zWDFBbHZ3VmU5a2gz?=
 =?utf-8?B?MWUzb2VUNEdJSG04TWNRQzBLY3FaWWZDZ2F3SHY0NVJ6NzBYaXdqb2hvVnpG?=
 =?utf-8?B?bTkxc0ZtZkc0VzJyeHYyNTNBYUh2MUtCYTRZS011cUs1dmVpajFiSTVJYjZC?=
 =?utf-8?B?Qk01ZzZiSzhJZzJ3T1dCRTB2Sjd6NE9mOFV1SUFpcmwzY0F6VEdLSjRqcjRs?=
 =?utf-8?B?T2FBa3BuamhSNHJGdnB6bDNYV2dFREVLZEd3ZUVxbWVTWDBxaHRDdDdudEda?=
 =?utf-8?B?Z2trNElsc1FPTXZMY3VndUxJdG50emhFS0xHeElJVXB0L3h3R0VYSFBmTTBJ?=
 =?utf-8?B?SzE1RWl6YmNOV2hLemVyQWxqb2JXWEZoVjJwWmpBR3VuYmxkUCtYMjBqZjhU?=
 =?utf-8?B?WWFqT0x3eGw4MWxiRmJjUG9OM3J1UDJ2VlQ3UEpmaWltcWs3aXh5TkFWT05G?=
 =?utf-8?B?ajJJcXZtdmczM1l2RzFDdFJ4bGt1TzVmRzlicTMyYWdFQ2dIbXcyMnJlVVRJ?=
 =?utf-8?B?NXIxRHFrc1NxaUVMZHN5eU5ObTBLbEpsaUdIR1NDQXgvM0FQcForZUNMMXVZ?=
 =?utf-8?B?TXRBZTFGNC94Ni9aTnl0VFdWTXBjTHRGcXM5a3NBL0t3RkI1OCsrN3JuVnp2?=
 =?utf-8?B?Mm9lejlWaW5kMGFjY21hMSs5YWcvU1ZJR2dhZk82RU8yRG5NaStOK3Q0V0Ey?=
 =?utf-8?B?SHhHQ01DbXhFZEN1OHh5cHRuWFU2TXBCcG9ydVE5UDFUNmdWRmpqbHV2VVdE?=
 =?utf-8?B?Rko0Q3AvSmVPaXBKMGVoRXBHVzBYbHp2YUFKRitnRGEzNVhrMHJEbzRacy9C?=
 =?utf-8?B?RGVkaSt4ZzZOZG1vSkJHZUhLZWU4OFdqTUUxS3dLZkVjR2pxbWNLK3ViaE90?=
 =?utf-8?B?VG9ub2dEdkw0cTRxdTBqQ0NiWk1peGp2cld3RFBJMWgvMnIzTVljT29nekFI?=
 =?utf-8?B?Um83UVV1cTVJZkU3YXZjVjhrOWtLZU9nUFB2TFJnWHgra2FQa0IvZi9Iczhh?=
 =?utf-8?B?YWwwOUtrWjFZbXhrYjRrM0hxWjNOLzQ0NHczRUpnckR2ejhJc0JlcnJNVVE1?=
 =?utf-8?B?WHRkOWRlb0p1K1FyYXoraDhTTUdHOTcxc0plOVhFVENOaVJnekh0VGFhSkNo?=
 =?utf-8?B?RitrVkE1OUNON240MTkrSk5qMFB5T1JndzViSmtFcDZtdjh4UVBuM3VOUjR6?=
 =?utf-8?B?YWduN2VibHRDVEdKdUp1NjF3WElZZG5qZFBPNmM5YXIxb1RHK2FlenVmR3VT?=
 =?utf-8?B?U2ZzV3RnanphdnZoVW9McnZ0enZ4YS9tSlJ6N2k5U0UyZ0Rac1ZqYjA1eXRM?=
 =?utf-8?B?dzg5cnJEdkRLRXpXdTVxQytWdWRLbHAvSUtURC9Da1Z3MytTWk0wUXA5Ymp4?=
 =?utf-8?B?VmIrbnFHSERjaTZaVlk0bFVVYm9nYWdIeG94OWFBUWl2ZTFrN0ZXRGx1S3JQ?=
 =?utf-8?B?K0FjM3Nha1RibHdhNGl5dDZyenkzK2wydUxCVUw3MHRRYmJqb2ZjdVpqNGZH?=
 =?utf-8?B?R2xyOWk4YjFQZklJYnZQUVZQbEc0OGVRWEZpaDVkWHc5dWxGRk1WWVZBbVRx?=
 =?utf-8?B?bURHY09EZUdRaXlYSFcydlBBdElOY3RPRG5kSFBEZFExdU1Qd3grZ2FKb3px?=
 =?utf-8?B?T3RlRGpib3QydkN6OTBnaFlheUh2emhvYlVTZ2JrTlUvcmdoVlBjdmdyaGk1?=
 =?utf-8?B?dFpkclRGaWo4US9aL1JjNzN3OGdFL3BrRjRYNlBkTmhhWEJSSWs4OVFmODZ1?=
 =?utf-8?B?c1J0dExRTTdnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TY1PPF33E28B4E6.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SElaUUlHVlFNeFV4Qlk3YXBFaGRJSmQrL0VidVhvSEl6Snp2aklKSTErK1hq?=
 =?utf-8?B?RWJNOFhxMHZHb0UvM0JNWTgwNll5emtrQllTZGljblFuaksyY3U0eFQvTUd2?=
 =?utf-8?B?MEFNbEdTdllpeitkQnByTVNhWE9BWWx2WnlYdXlTeTdnUnpSNm5pR1dFdXFM?=
 =?utf-8?B?Tm50YlVrWTE0ZjRTQjAzV2hhRGp3RjZIUE14dFQ4bHMvSGFyNkU2U3ZGNkFo?=
 =?utf-8?B?bUpDTW5haDJ1dWFQditDL0plb0phYVFjVkJJelNES3NndytSSE9QWlFlZkpw?=
 =?utf-8?B?LzFicllUU0RlWE80YXQwNmt1OXNDTHpsbGtWeXVMcXQ0RzZTbFROUURZUlpY?=
 =?utf-8?B?U1EwOTRnNFlRSFMvN0owYUlSUmZMc2thaFJ4MU9EZDBSOUtWZ3AvSWdhbXht?=
 =?utf-8?B?ekxvYURtaWxud1FGNmtvcGRTRGNMWEJNTURUQlJDYWdFaXYxeXJOdVpzSFY5?=
 =?utf-8?B?RFluWjRYdHVjK1oyN1pwRzVEWGs4VzhjR2VnZWhSczE4Sndxd0NCa28rb3lH?=
 =?utf-8?B?WFVld2gzR1IrZmh5L1JSaU1ITS8ra2didHhzTTkzeGJBVFQ0TUV6WVNXM0l4?=
 =?utf-8?B?ZU5nOTRaa2ZBd2xZbW9XbldLTjNsVThGZndCdlE3aWhadmtVSUZxL2JJMnJ5?=
 =?utf-8?B?bFVJemhwaXA2V2hlck04aFNnSTRPZHVXL1VNOWE5S1VqTkZKTlhlVGhTaytr?=
 =?utf-8?B?WGZYNG05cHZON2NaeWhacWVQN3RZUEFaSngwazhzckxZR3VqRFhmMXM5U216?=
 =?utf-8?B?QXVmQ3pST0d5cktpNHZDTHVmYUplcWlJOHlxbFNjdWxscVNpK0pXd3RsZld4?=
 =?utf-8?B?YThGcS9IOEo0V2oyb3NldU41b0JKTGcxVm54eEY1NVRoUHdKcEdvYnBLRzF2?=
 =?utf-8?B?YytMM0hxTm1tbm5ZUVRqTjZySWh4alhzS3F5Q1RmbDRTQ1VsSmFsRUhwai9C?=
 =?utf-8?B?dHdHaXhIQ0E1NFhqdjJpQTd1UWlLRTIwTmdjbUEzQnVqZ2lRMHZVbERQRUtM?=
 =?utf-8?B?TDNTODZGb0pUYzdZRHp1OUJFS0k5QmFCNHg2WDd6cUNPbnJ4RTJUQm1QNXM2?=
 =?utf-8?B?VjZRaCs0UHFoQlpxbHVwQnhSbE9jdnRqWWloZGs4VWxFY0JzRmlEaFVkT0g3?=
 =?utf-8?B?eUltRE15YjhSVE85MlJpTUxLRmhoZ1BKODlBZ1NvT1FYeXVkK2MyREp4azJx?=
 =?utf-8?B?ZjN2bXdKQlFXNkw2anFYTU8wNDRuSEdlQkIxSWkzMGEvZTQwb2h5dzBxQWlQ?=
 =?utf-8?B?Zloxd0ZEb1RTeTkzMGNYSUkvcGlERGtwRytTRUJoUmF4cGxUWjFQZjR0dytF?=
 =?utf-8?B?MnpZQTQ1a3lURGVudnpYSzBQVTBvUlMwT3BRc1ZxNXora3B5UjBTRnJ2Zm00?=
 =?utf-8?B?cmtjNERPL0hYWVNuWHE1YlMvbThtenB0VDIvbHptUURzTTZzL05rVFloNkdm?=
 =?utf-8?B?cUlTUWQ1WXo0RnVXQkFraHFDbDVlbGRremZMVE5RQ2hBQ053aElka25FKzJR?=
 =?utf-8?B?dkdOUCsvNUZRM0dKRlJlNXIzMVB5QzNHOGFtTDR6bk4xVGwvVFRyZzZPRmdS?=
 =?utf-8?B?akFwMlpqS2JqKzBNRkNYYXBhOExmOHVmUC9mUmZDZkJrZGg0WEd6ZjF5U3Zj?=
 =?utf-8?B?RWx6cTlhY1dvcHR6c1ZwbEllTmVGUXZWYXc1dGJjQmdIK01uRUVnTlVuZVN3?=
 =?utf-8?B?cEIxSWd2VlVuUHZyQXV4Y1lSa0R0bkR3NFNGVW8rTkhBaXlGVkNqYVZCcEtp?=
 =?utf-8?B?L3gzNGJRWWpzSTVxT0hrWHphS1V0VGdUU1JyMFFVVnEva0dJUnFRN0ZZL2NE?=
 =?utf-8?B?RjF3MTZPb0ZhbXIyaUpUZHd5ZXVmUk1WNmtPaE44WkxhSnRHTzV0aGRLOWhO?=
 =?utf-8?B?ZTJXNVJPQW5sTGU0cUVUUGVPTmtKenJHQmVVdzkrQlVlaU9ZZm9DcUttd3Z4?=
 =?utf-8?B?ZzNSQTZsbTBackdkeWV3cE9pY2ZqUlEySmEwT3I1MWpGWU9UekhrTDhMTlJP?=
 =?utf-8?B?cmJ1eHdLZ3VMSFdmQWdVdFcrSVZCUTc2a0c2N2hoQXBDRWZoV0pLSUwwTUsv?=
 =?utf-8?B?QXBtbjlIN2h1QlpSWjkxSUdjeWUwQ0pkYWFWcUNFN0ZuWC82WDg2MmxWaWcy?=
 =?utf-8?Q?V8oI=3D?=
Content-ID: <0766EE423243904AA2A8A3069469E112@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY1PPF33E28B4E6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ee6285-9cae-4565-bfa4-08dd98709542
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 14:05:46.4187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qavm94Jru/Xo8Y1pjelUzSqInjWkmkd04N6eYi2B/92jppbsXUUI4rMrv7CAqvV8rU/FSCfgRJ0Q2rjAbDE7nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6232
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 1/3/2025 3:00 PM, Chunhai Guo 写道: > 在 1/3/2025 11:36
    AM, Chao Yu 写道: >> On 2025/1/2 18:13, Chunhai Guo wrote: >>> If userspace
    issues an fstrim with a range that does not include all >>> [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: vivo.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [52.101.129.14 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [52.101.129.14 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [52.101.129.14 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [52.101.129.14 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1uHk4z-0004Tu-Vz
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix missing small discard in fstrim
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDEvMy8yMDI1IDM6MDAgUE0sIENodW5oYWkgR3VvIOWGmemBkzoNCj4g5ZyoIDEvMy8yMDI1
IDExOjM2IEFNLCBDaGFvIFl1IOWGmemBkzoNCj4+IE9uIDIwMjUvMS8yIDE4OjEzLCBDaHVuaGFp
IEd1byB3cm90ZToNCj4+PiBJZiB1c2Vyc3BhY2UgaXNzdWVzIGFuIGZzdHJpbSB3aXRoIGEgcmFu
Z2UgdGhhdCBkb2VzIG5vdCBpbmNsdWRlIGFsbA0KPj4+IHNlZ21lbnRzIHdpdGggc21hbGwgZGlz
Y2FyZHMsIHRoZXNlIHNlZ21lbnRzIHdpbGwgYmUgcmV1c2VkIHdpdGhvdXQgYmVpbmcNCj4+IEkg
ZGlkbid0IGdldCBpdCwgaWYgZnN0cmltIGRpZG4ndCBjb3ZlciB0aG9zZSBzZWdtZW50cywgd2h5
IGRvIHdlIG5lZWQgdG8NCj4+IGlzc3VlIHNtYWxsIGRpc2NhcmQgZm9yIG91dC1vZi1yYW5nZSBz
ZWdtZW50cz8NCj4gQ3VycmVudGx5LCBhbGwgdGhlIGRpcnR5IHNlbnRyaWVzIGluIHRoZSBkaXJ0
eV9zZW50cmllc19iaXRtYXAgYXJlDQo+IGhhbmRsZWQgaW4gdGhlIGZzdHJpbSBwcm9jZXNzIHJl
Z2FyZGxlc3Mgb2Ygd2hldGhlciB0aGV5IGFyZSB3aXRoaW4gdGhlDQo+IGZzdHJpbSByYW5nZSBv
ciBub3QuIFRoZXJlZm9yZSwgdGhpcyBwYXRjaCBpcyBuZWNlc3NhcnkgdG8gYWRkcmVzcyB0aGUN
Cj4gaXNzdWUuDQo+DQo+IGYyZnNfZmx1c2hfc2l0X2VudHJpZXMoKQ0KPiAgIMKgwqDCoCBsaXN0
X2Zvcl9lYWNoX2VudHJ5X3NhZmUoc2VzLCB0bXAsIGhlYWQsIHNldF9saXN0KSB7DQo+ICAgwqDC
oMKgwqDCoMKgwqAgZm9yX2VhY2hfc2V0X2JpdF9mcm9tKHNlZ25vLCBiaXRtYXAsIGVuZCkgew0K
PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi4uDQo+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBfX2NsZWFyX2JpdChzZWdubywgYml0bWFwKTsgLy8gc2Vnbm8gaXMgY2xlYXJlZCByZWdhcmRs
ZXNzDQo+IG9mIHdoZXRoZXIgb3Igbm90IGl0IGlzIHdpdGhpbiB0aGUgZnN0cmltIHJhbmdlDQo+
ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4NCj4gICDCoMKgwqDCoMKgwqDCoCB9DQo+ICAg
wqDCoMKgIH0NCg0KDQpIaSBDaGFvLA0KDQoNCkNvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSBzb21l
IGFkdmljZSBvbiB0aGlzIGlzc3VlIHdoZW4geW91IGhhdmUgYSBtb21lbnQ/DQpPciBkbyB5b3Ug
aGF2ZSBhbnkgcXVlc3Rpb25zIGFib3V0IG15IGV4cGxhbmF0aW9uIGFib3ZlPw0KDQpUaGFua3Ms
DQoNCj4NCj4gVGhhbmtzLA0KPg0KPj4gVGhhbmtzLA0KPj4NCj4+PiBkaXNjYXJkZWQuIFRoaXMg
cGF0Y2ggZml4ZXMgdGhpcyBpc3N1ZS4NCj4+PiBUaGlzIHBhdGNoIGlzIHNvbWV3aGF0IHNpbWls
YXIgdG8gY29tbWl0IDY1MGQzYzRlNTZlMSAoImYyZnM6IGZpeCBhIG1pc3NpbmcNCj4+PiBkaXNj
YXJkIHByZWZyZWUgc2VnbWVudHMiKS4NCj4+Pg0KPj4+IEZpeGVzOiBkN2JjMjQ4NGI4ZDQgKCJm
MmZzOiBmaXggc21hbGwgZGlzY2FyZHMgbm90IHRvIGlzc3VlIHJlZHVuZGFudGx5IikNCj4+PiBT
aWduZWQtb2ZmLWJ5OiBDaHVuaGFpIEd1byA8Z3VvY2h1bmhhaUB2aXZvLmNvbT4NCj4+PiAtLS0N
Cj4+PiAgICAgZnMvZjJmcy9zZWdtZW50LmMgfCAxMCArKysrKysrLS0tDQo+Pj4gICAgIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYw0KPj4+IGluZGV4
IDhmZTlmNzk0YjU4MS4uYWY5YTYyNTkxYzQ5IDEwMDY0NA0KPj4+IC0tLSBhL2ZzL2YyZnMvc2Vn
bWVudC5jDQo+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMNCj4+PiBAQCAtNDU1Miw2ICs0NTUy
LDggQEAgdm9pZCBmMmZzX2ZsdXNoX3NpdF9lbnRyaWVzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwgc3RydWN0IGNwX2NvbnRyb2wgKmNwYykNCj4+PiAgICAgCXN0cnVjdCBsaXN0X2hlYWQgKmhl
YWQgPSAmU01fSShzYmkpLT5zaXRfZW50cnlfc2V0Ow0KPj4+ICAgICAJYm9vbCB0b19qb3VybmFs
ID0gIWlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9JU19SRVNJWkVGUyk7DQo+Pj4gICAgIAlzdHJ1
Y3Qgc2VnX2VudHJ5ICpzZTsNCj4+PiArCWJvb2wgZm9yY2UgPSAoY3BjLT5yZWFzb24gJiBDUF9E
SVNDQVJEKTsNCj4+PiArCV9fdTY0IHRyaW1fc3RhcnQgPSBjcGMtPnRyaW1fc3RhcnQ7DQo+Pj4g
ICAgIA0KPj4+ICAgICAJZG93bl93cml0ZSgmc2l0X2ktPnNlbnRyeV9sb2NrKTsNCj4+PiAgICAg
DQo+Pj4gQEAgLTQ2MDksNyArNDYxMSw5IEBAIHZvaWQgZjJmc19mbHVzaF9zaXRfZW50cmllcyhz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMpDQo+Pj4gICAg
ICNlbmRpZg0KPj4+ICAgICANCj4+PiAgICAgCQkJLyogYWRkIGRpc2NhcmQgY2FuZGlkYXRlcyAq
Lw0KPj4+IC0JCQlpZiAoIShjcGMtPnJlYXNvbiAmIENQX0RJU0NBUkQpKSB7DQo+Pj4gKwkJCWlm
ICghZm9yY2UgfHwgKGZvcmNlICYmDQo+Pj4gKwkJCQkJKHNlZ25vIDwgdHJpbV9zdGFydCB8fA0K
Pj4+ICsJCQkJCSBzZWdubyA+IGNwYy0+dHJpbV9lbmQpKSkgew0KPj4+ICAgICAJCQkJY3BjLT50
cmltX3N0YXJ0ID0gc2Vnbm87DQo+Pj4gICAgIAkJCQlhZGRfZGlzY2FyZF9hZGRycyhzYmksIGNw
YywgZmFsc2UsIGZhbHNlKTsNCj4+PiAgICAgCQkJfQ0KPj4+IEBAIC00NjQ5LDggKzQ2NTMsOCBA
QCB2b2lkIGYyZnNfZmx1c2hfc2l0X2VudHJpZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBz
dHJ1Y3QgY3BfY29udHJvbCAqY3BjKQ0KPj4+ICAgICAJZjJmc19idWdfb24oc2JpLCAhbGlzdF9l
bXB0eShoZWFkKSk7DQo+Pj4gICAgIAlmMmZzX2J1Z19vbihzYmksIHNpdF9pLT5kaXJ0eV9zZW50
cmllcyk7DQo+Pj4gICAgIG91dDoNCj4+PiAtCWlmIChjcGMtPnJlYXNvbiAmIENQX0RJU0NBUkQp
IHsNCj4+PiAtCQlfX3U2NCB0cmltX3N0YXJ0ID0gY3BjLT50cmltX3N0YXJ0Ow0KPj4+ICsJaWYg
KGZvcmNlKSB7DQo+Pj4gKwkJY3BjLT50cmltX3N0YXJ0ID0gdHJpbV9zdGFydDsNCj4+PiAgICAg
DQo+Pj4gICAgIAkJZm9yICg7IGNwYy0+dHJpbV9zdGFydCA8PSBjcGMtPnRyaW1fZW5kOyBjcGMt
PnRyaW1fc3RhcnQrKykNCj4+PiAgICAgCQkJYWRkX2Rpc2NhcmRfYWRkcnMoc2JpLCBjcGMsIHRy
dWUsIGZhbHNlKTsNCj4NCg0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
