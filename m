Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF832AC3AEC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 May 2025 09:53:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuvnO9fwKO4Pu6ZQWyYPcmDKFJluoYm+7Q2e1Z23Y2c=; b=aIkpZRBeKSN6/iqCXxbUO7ydVk
	F9wKZWAxHQAtAabOJ9/d2rFYW9YZc8nrk977ypSq8eCyxVKxIMb4436QJ1IXop6p4QLKaJN1Sb7jb
	5ZrYIMJU/4xEuwLbpbO/NqEruY4uQfT4otyS0oQnA2nk285Cga1O9+L+st265KGQ/AEs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uJSe1-00020p-T7;
	Mon, 26 May 2025 07:53:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1uJSe0-00020h-Qy
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 07:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g2v4RDrJs6k2MLOOWqTXD+2IUAtEogpTsYgb1bNy9so=; b=mKVI40QgFkmId/qAJFuAD2W5ju
 VJSfC+/lUzZeN9wLRJj6ikJmaaiGASAP5cMMHzLWDZcm3g1rwjo6oqpum/dXTUUfZ3RYUb6KzZBy4
 mpqxe3KdKS/CNVqDGdZp8jLXslOfUbux1i8KvLfV0iAPQHtrF42tsIQ4sEEjhoBOtti4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g2v4RDrJs6k2MLOOWqTXD+2IUAtEogpTsYgb1bNy9so=; b=ZrW8utb0hBlNdvfj0UZEvZLKJV
 +IP19ef9r1AOlDazyhrbCUxVGF9cgQcOQvL8hf9H4f2nJrsh4jBAa4c3heR4/aNs43mwWSkkbvZDW
 XmL3DuVZLgOjW8NL+Ij6f2ISs3gYFUeOBpVO9iKZkEv1ucrRNcjE/vq6Pq2LPK6bFrmk=;
Received: from mail-japaneastazon11012057.outbound.protection.outlook.com
 ([52.101.126.57] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uJSdz-0001u9-S8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 07:53:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uohqVUsK5F8Qh88MtavqUGwUi3dSEb2IlZ6TJQK/5wb4j/10xTPoUsUj4ElOEV3v34sY54rhae60htRHHeJ6SCO4zL4Ujx0RQPaYHMrSao3Buln7OJ6jxaAcPAmGvaU32qfeB1Sczv2+Et6FowmBZfs/iLL7ZWSQ1r/LG+4HhKxEbKIled7hFV6805p1MNpRvICVNFxJI5ZtY7um29ow0OM8lKMcpwCb31VizFf1YcG3Wjr0y0ipEJWkPEOFIH0x4lCPo3MKCKYgkjvPl8iq8Izc5TTOtB8c2Tx2SdXhm7V8Bt+A/8s7NrXt9Nb+p3OvwSM4N6ysKYZmeYils+E84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2v4RDrJs6k2MLOOWqTXD+2IUAtEogpTsYgb1bNy9so=;
 b=Vi0HEHRaTJSN5M4N/2wWazXWZbVeKlGJLQYGNl8ya4iy6j2AA3AeHVOETOHUzXBnLWojSEfkR1yKXcHOQEI8fhL93s0u5CgW8Svmw1NXp6VtmZQ612Z9xKqVesII6yJqPBmgxSUAxZlgdi9iARhK+I6cZQm0nvFfYSDzCtG/ekp0TYDzfqYJjPreSrXBqtCRKJrqVduUV7Mo36wPUdtP5Jr3eT6ocs2uyLOOp0CBbv9DGhufz+n+M5E4LkIoFLCtybswnYcGb3pmDgc4oWqwEbuI3d94HyKHOi6wojIOFH7jrxOzLJt9MGXPY//kKtd6hiRFJBanwKtzfE2NWCvmOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2v4RDrJs6k2MLOOWqTXD+2IUAtEogpTsYgb1bNy9so=;
 b=rGZwBMFXRP0lfpBfHUFyzLVVSfapBgh05AFS4MAw2PwabiDpNlYc62CMky4UL8Q4jgT27P5YgmPxpiE0MWbqxfiDLL35qOTIFHyL7Q8xI56seV7zcv3Hv9+X3rZ19OpMmDGe38OhGHJN25qvJjihg7M862MNTkuDm2niejFQrZoEKlPhaiVCeE04CWEQm+eAkJ6Cih11SuOyfjz59aLKBj4hqYb5zvQvzI/GIybfDlnvXWns2ximKwxk3ECir/SCresoaf1eu+x1XkDdB5mALG/tsJhBy6oc1iAjAn4Hc+F8XQFxB5CuuSR/HOsgffApyNLeTwNt0kuVTmag7KHcUw==
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e)
 by TYZPR06MB7062.apcprd06.prod.outlook.com (2603:1096:405:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 07:33:35 +0000
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::a57c:8e30:d8a3:54f1]) by PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::a57c:8e30:d8a3:54f1%3]) with mapi id 15.20.8746.030; Mon, 26 May 2025
 07:33:35 +0000
To: Zorro Lang <zlang@redhat.com>, Chunhai Guo <guochunhai@vivo.com>
Thread-Topic: [PATCH v2] f2fs/014: test for missing 'trimmed' flag issue
Thread-Index: AQHbyuxHuLMARxSHDU+a/SLDUxhcJbPgSRYAgARCCgA=
Date: Mon, 26 May 2025 07:33:35 +0000
Message-ID: <f568d444-7f1b-430c-b132-32799c481c09@vivo.com>
References: <20250522075706.1604641-1-guochunhai@vivo.com>
 <20250523143210.zxrj3prdqbtizwou@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
In-Reply-To: <20250523143210.zxrj3prdqbtizwou@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PPF5540628D6:EE_|TYZPR06MB7062:EE_
x-ms-office365-filtering-correlation-id: 54214941-de49-46c2-9847-08dd9c279f8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Ym9Gdkh0eHUxR3lUQWIwM1pPTjRpcmYyVXdzYlhGTmhvcWdQaFA5RCs1M0R6?=
 =?utf-8?B?WUp0Vis4MithQTJVK2RHVldjUW4wTHNYeFdFRFpIK3JCdUYwQjUxOE9lS2xk?=
 =?utf-8?B?bkp6bkdYQ0FCZjN4NkhwTTdCdjRlVlJlc0FqUTBqWDBoVWQxMDhmOG9IMVNk?=
 =?utf-8?B?ZU8rSEZpMVFUaXNOb3JKVHlhU1N6Q2NCYUQzWk1DaVJSSW1Rc2tYcXQvN01o?=
 =?utf-8?B?Rm9jMkRaS1luZFlkTVZhN1Y4K3h0R09vNStvdWZYenNDOThRNk5KMVlxVkRq?=
 =?utf-8?B?ZlZrcUxjVVlHOURpbng3NmNDM0lDdk5tZHNKTUtSME91TXNJY21KM2ZnaTVM?=
 =?utf-8?B?R0hGaEtrcXFKelZieGlFSFVIV2MzV3daMVhjbzliSTVNWlVmSmN4bGY4Z29Z?=
 =?utf-8?B?R0E3RXhSU2x5aFQ2akhPaFI3RWtVdlJrRzBxUzJRaFRBNzRBeUFjZkZNYWpM?=
 =?utf-8?B?eVdvR2tRY05UZnZHSVhXR2JzazNFK3hTdEhXd0Jxa0EwTkJoT0xpYzZzY2dX?=
 =?utf-8?B?bXlSRjkrU1JTSkhzTDdBR1NjMGR6c0VKSTgwcll5cVVzSytaWWZCUlRYTVJk?=
 =?utf-8?B?R1E1K1N6SVVlTURrbmp6VVFYRTZ1RFhOVmtLWU0rTi9NbHNuejE2LzM2NlZW?=
 =?utf-8?B?WlhHaTdTVnFkVWdlOGk5UVlKblJienVhUjNyWTZza0srd0dXRkRUWjFNL3Vi?=
 =?utf-8?B?NjF3Z0dXRE1VNzdFbUFQMi9qcnVMejR4Yk9zcEhhTWkvQndoNFY0cTlBcW5z?=
 =?utf-8?B?WXhXSGRENkJXUEdGZmdVRXNjMm1oQ0tqaHprN2hsNCtJdnNiZStvYmtWcTZU?=
 =?utf-8?B?aVJPVTF0Y0lFclRFd0NmUCtUL2M1eUUxdGFXYURpM3ZheW1GOGRSdDhEUDNx?=
 =?utf-8?B?aGJ4cnlObGVjdXJ3U3lXMkZGVFhwMllxK1ZWKzR1aDZPN1NLQkNPelFhaDlv?=
 =?utf-8?B?dnpmVFowb1AzWXM2bGhNOHJwZE5BRVVndzJER3h6Z2poODg0aS8xRS9tMFg3?=
 =?utf-8?B?dHhyOTd1ZWxYVVBYa1BCSldQM3c4K0NLVHdiN2c2YlZqaUptR2xXT09VNExJ?=
 =?utf-8?B?Y0oxeXFiRjAydDJPNWpzc3BMMlczRXZxUGxSRk1DeHVMTmxwYjR2amtuZUUr?=
 =?utf-8?B?OFpOVHNSQmE4czB6T1NrTHZBYjhCcGljSTJ4VWgycW94a2FKem1vajVDaWR1?=
 =?utf-8?B?YURDSlo3TXQ0aXB5MWNDTnllU2MzN25jNzJKZ25TSUc3OHZ2OHUxeFZIWWhr?=
 =?utf-8?B?dDF1d043VlNkVGQrUHkrUDRJYkw2UVpxaFJyMDdBMWJ3OGhacXVoY21nWUls?=
 =?utf-8?B?cElVOXZGN0R5MTBvR04wQnNHRnNlbXdQSFh3aEtFdWF0V1ByOGVGd244d3d0?=
 =?utf-8?B?ekRxNFluZk5SbEY4R1ZtTWtId0VkYnJMTmsvNkNOb1FJUHphcVpmZ3JiRW56?=
 =?utf-8?B?U295aVRiYTRYYktlcFdycWZTMU5IZDY2WlZJaS9Hc2d3V21meFRFTHhpalVI?=
 =?utf-8?B?RnRMWEZnZFhQalpWVm1SeEE4NG5SYjRIaE1VdTBVWVQ2Y0xRS3VrbHJVUUFy?=
 =?utf-8?B?cWRCUXVQWmFnMVorbnRJSnl4RHNJQWorNHg1ZlNhNHZNOGc0Nm5nSXRRbnh5?=
 =?utf-8?B?ZTYwS1VlRDBYQU9GdGdzeGNqNXpVbDhLOEl2a24vQStlWTJReTU2aC9wdkVY?=
 =?utf-8?B?Ym9BeUFvcEVPcklNN1hGSUFuVzJucTlxbXpxL0ErdTVCTlhwY1hlYVhucEE0?=
 =?utf-8?B?Vk4wV2Q1WlNaQmZ1bksyZEl6cjF2RWpTWFRBcDc0OXlOejdpVVo3dWJMZG05?=
 =?utf-8?B?QWZLc2Y1eGJyTnBJNUsycmhxaTdQTm5GeGxyQVpQL09IbW0zOFNLVmw5SVVh?=
 =?utf-8?B?R2w2NmhzNEhXY1J5a1Z6Y2Fnbkd4VThRMEhpNjVVakQrMjRqMEdDT1p2bzln?=
 =?utf-8?B?Q2JVYU5nUVloZCs3WGs5REhVN1haa3NUK091ZFA0SDFKUElqTHd4RlIrMzli?=
 =?utf-8?Q?IXXCNtNZXLrriiMiuTm6pxzSkdOYoc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:PS1PPF5540628D6.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlRRY3RMZURLam5yS0x6QkYxNi93K1JKcFBrb1NNWFJWZGM3MjVOdkpKaUIy?=
 =?utf-8?B?QTBXa1FWUTk3NFB3QTl2NWVHSlVieGM5dGNaZDNWS0swSmZUSlhjRnpFUU40?=
 =?utf-8?B?UXJlSFczdXp5RXhxODJkQWhRUmN5Q0FOR0t1WkRIaURYNGlBbjVGU3cvaXMx?=
 =?utf-8?B?eHYvbDBuclNlY1NHYWVLUXN6VXdCZm5pU1FwV05qUS9iT2tuL3pvMzZLc2lH?=
 =?utf-8?B?RVEzKzltd3A1dlZQYkVQSEUyRUoycXRNQ1B2MElYR08vcDRLZXFDU0s5eWhE?=
 =?utf-8?B?Z1A3MXJzVlQ5NUZSR3AzMEU4YVR0SEEydmNNMGZaeEdxcDBJc0pJN3l1TXNB?=
 =?utf-8?B?TFRlQlpWY0ROLytqdVVkUVR3cS95NHJ2YXN6RURwdDdtYW5vT3VEZlY0Tnhl?=
 =?utf-8?B?cmlPd0M4TFc5TWt2WFp1dlVxdjBnTTV4a2VHQlpuaWZESXlSa0JXM096YWZG?=
 =?utf-8?B?eDBZelJDN3RSaVphKzdFQlpsb0FXR3YzQmJPS0JEdlhKZkNpTFQrMFV4Tmxi?=
 =?utf-8?B?L3VlTkdUV2Z2ZEtNT2xBTHNxdkxQcUY1VXlsWFZuVFIvdjd0Q1JjSUZDRWZl?=
 =?utf-8?B?K1F6UXZxdExNUFpMUFpoNkgxN0Z6ejVSNEtRZkV6ZDAvZUJJdGpzcFo1ZTVq?=
 =?utf-8?B?Sk91UFE5NlIrdVBrd2orVnUrYVowRGgvaUtLSWVFUCtSRldmeE84WUlnTWJH?=
 =?utf-8?B?ekFHRUVPWXNIbHpQVnJnMW43cGRKbHMxMnNOaEhpWGVZSFVtSU5NQTdrcVNW?=
 =?utf-8?B?cHhFbWZRdnppRlZsRjJnSFNpUHlvb25FNThGQ0grZlFlejM0ZHN2bWFOTEtx?=
 =?utf-8?B?TVROWG52aDYzZ3JvZkJsN2RuSDA5QjRKTDgrQ3ZxUU9ROG9WN081UDJ3MHBz?=
 =?utf-8?B?b1I4VkJpTzQ5bCtSZFU4ek9tZ0pqSUlXbWJlcDNwaUJvZEdUWWt1TnJyUDVv?=
 =?utf-8?B?ZVhxY0lCcHpxUnBsVHFpYUhLVEVPcGtPbUlxZkxTN2FKWk1sVkxOZlJtT2Rh?=
 =?utf-8?B?UlpuTU0yR0FCT3Y5VjRpTUpFQkkzVHUxL013WHV5THVINjdmdDd5NnYySm0z?=
 =?utf-8?B?MFRrTDBmb3MyV3BiYk5lU1VYQXFTa2txS09Ec05MaDd2VXB4L0d1WnQyNURu?=
 =?utf-8?B?RS9wdGpQa2xNVDNQd09EemdvZWgwMFEwYi8xRVdPMk9VRGUrSm5UT2I2Rjh5?=
 =?utf-8?B?YmNYKzBLWklNUVNnWGZ5bW81NXhIU1pQYkxKYmRxTFd3OStEUkJnR3cyZkJB?=
 =?utf-8?B?Znl0b0pmTVpaa2tnWU5MUldXclJ1ZGtWMW5ZOXNrQ3doN0lUTU9mUUNkYWtk?=
 =?utf-8?B?YnZyS2tCMDRLVFFtd2YvOTJrQ2pabnhxZWc1WUFaUjNmS2x2akhoTjI1NTlr?=
 =?utf-8?B?RkRhdmR3RlZ6R3J6R3BmY1FTZG1PQzFIeWlTSDJGa2o5aExsd09qcStFL28z?=
 =?utf-8?B?aFlnbXFQU2gvUS9zcGtMd0w2MkltbXQ5ejZXVnNZakNQY0xDYnZqWnk0REw0?=
 =?utf-8?B?S2I1STF3cVYxdWdkd3g3YUJEYXBjeFdCNGxTOE5ZUWVoSzNNOUlJaW1mOE4v?=
 =?utf-8?B?aitFRkE1UkxzVFZDZXRjQkJRc0VmOVdJRVVISmhPSzBjZnZyRGV2cy9odnlE?=
 =?utf-8?B?T3RqNjBKWWRVRXVDOG94WWVUbEl1SGN5a2g3a0FYVjNjYjZsRko2Ympkck96?=
 =?utf-8?B?NHlzU1BIMmVGWG5KOXRBZGkyZjRzdUY0N1A4UmtkK1ZtK1ZiSTdkRnA5WlhN?=
 =?utf-8?B?d1RZNnNiTG5BUmRXd3A4QmxyWFhNMCtXTU1IamluMDRuY3g3ZmxGYk16NHEw?=
 =?utf-8?B?cmR3eVlCSWtYNkZxM3RYOHlFbnFPOWhZN2M2dk11cEZZVElEMDVLRmtzbVhj?=
 =?utf-8?B?aDdYSFBSeWVUTjQxbFUxVU1VYUlFTFZwQU9iZ0RpYzh2WjU3S0FmZkdOOWlQ?=
 =?utf-8?B?a2VHdHdoRXpHTmZwakcvZlMvTHovaVV0SndvK2FkT3hRNnhPTDBVdmNYc0NO?=
 =?utf-8?B?Tkd5bUkxbUNXaGJFQ1BUamlZU2xjVjFZazdnMVZCd1dFNUNIdDlpbzZpZ1lL?=
 =?utf-8?B?TEtSMEV6c3dNTTNoOXNCRTN3MFFPdlJYZjBkemJVdHdTNTFSYVBqdldRTDlB?=
 =?utf-8?Q?jZjQ=3D?=
Content-ID: <53F614A31079DF47BB9FD9404C9AA919@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF5540628D6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54214941-de49-46c2-9847-08dd9c279f8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 07:33:35.0862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fq236lgMJFn+WxXLKIxuRt2GhyYogFeh1adM+ZuYThlOx6+sJIxnSmyrg5IucFzgEstuLvbKw+uKok4B0WtEwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7062
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 5/23/2025 10:32 PM, Zorro Lang 写道: > [You don't often
    get email from zlang@redhat.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification
    ] > > On Thu, May 22, 2025 a [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [52.101.126.57 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [52.101.126.57 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [52.101.126.57 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [52.101.126.57 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1uJSdz-0001u9-S8
Subject: Re: [f2fs-dev] [PATCH v2] f2fs/014: test for missing 'trimmed' flag
 issue
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "zlang@kernel.org" <zlang@kernel.org>,
 "fstests@vger.kernel.org" <fstests@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDUvMjMvMjAyNSAxMDozMiBQTSwgWm9ycm8gTGFuZyDlhpnpgZM6DQo+IFtZb3UgZG9uJ3Qg
b2Z0ZW4gZ2V0IGVtYWlsIGZyb20gemxhbmdAcmVkaGF0LmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMg
aW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlv
biBdDQo+DQo+IE9uIFRodSwgTWF5IDIyLCAyMDI1IGF0IDAxOjU3OjA2QU0gLTA2MDAsIENodW5o
YWkgR3VvIHdyb3RlOg0KPj4gVGhpcyBpcyBhIHJlZ3Jlc3Npb24gdGVzdCBjYXNlIHRvIHZlcmlm
eSB3aGV0aGVyIHRoZSBDUF9UUklNTUVEX0ZMQUcgaXMNCj4+IHByb3Blcmx5IHNldCBhZnRlciBw
ZXJmb3JtaW5nIHRoZSBmb2xsb3dpbmcgc3RlcHM6DQo+PiAxLiBtb3VudCB0aGUgZjJmcyBmaWxl
c3lzdGVtDQo+PiAyLiBjcmVhdGUgYSBmaWxlLCB3cml0ZSBkYXRhIHRvIGl0LCB0aGVuIGRlbGV0
ZSB0aGUgZmlsZQ0KPj4gMy4gdW5tb3VudCB0aGUgZmlsZXN5c3RlbQ0KPj4gNC4gdmVyaWZ5IHRo
YXQgdGhlICd0cmltbWVkJyBmbGFnIGlzIHNldCBpbiB0aGUgY2hlY2twb2ludCBzdGF0ZQ0KPj4N
Cj4+IFdlIHNob3VsZCBhcHBseSB0aGUgY29tbWl0ICgiZjJmczogZml4IG1pc3NpbmcgZGlzY2Fy
ZCBmb3IgYWN0aXZlDQo+PiBzZWdtZW50cyIpIHRvIHJlc29sdmUgdGhlIGlzc3VlIHdoZXJlIHRo
ZSAndHJpbW1lZCcgZmxhZyBpcyBtaXNzaW5nLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENodW5o
YWkgR3VvIDxndW9jaHVuaGFpQHZpdm8uY29tPg0KPj4gLS0tDQo+IFRoaXMgdGVzdCBjYXNlIGxv
b2tzIGdvb2QgdG8gbWUsIGp1c3QgYSBmZXcgcGlja3kgcmV2aWV3IHBvaW50cyBhcyBiZWxvdzoN
Cj4NCj4+IHYyOg0KPj4gICAgLSBTa2lwIHRoaXMgdGVzdCBjYXNlIGlmIGRpc2NhcmQgaXMgbm90
IHN1cHBvcnRlZC4NCj4+ICAgIC0gUmVudW1iZXIgdGhpcyB0ZXN0IGNhc2UgZnJvbSAwMTIgdG8g
MDE0Lg0KPj4gdjE6DQo+PiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRl
dmVsLzIwMjUwNTIxMDY0OTUyLjEzNzM2OTAtMS1ndW9jaHVuaGFpQHZpdm8uY29tLw0KPj4gLS0t
DQo+PiAgIHRlc3RzL2YyZnMvMDE0ICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+PiAgIHRlc3RzL2YyZnMvMDE0Lm91dCB8ICAyICsrDQo+PiAgIDIg
ZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA3NTUg
dGVzdHMvZjJmcy8wMTQNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2YyZnMvMDE0Lm91
dA0KPj4NCj4+IGRpZmYgLS1naXQgYS90ZXN0cy9mMmZzLzAxNCBiL3Rlc3RzL2YyZnMvMDE0DQo+
PiBuZXcgZmlsZSBtb2RlIDEwMDc1NQ0KPj4gaW5kZXggMDAwMDAwMDAwMDAwLi5mNzJkNTNlNjUy
OTINCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL3Rlc3RzL2YyZnMvMDE0DQo+PiBAQCAtMCww
ICsxLDQxIEBADQo+PiArIyEgL2Jpbi9iYXNoDQo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPj4gKyMgQ29weXJpZ2h0IChjKSAyMDI1IEd1byBDaHVuaGFpLiAgQWxsIFJp
Z2h0cyBSZXNlcnZlZC4NCj4gWW91J3JlIHVzaW5nIGEgZW50ZXJwcmlzZSBtYWlsIGFkZHJlc3Mg
LS0gQHZpdm8uY29tLCBzbyBJJ20ganVzdCB3b25kZXJpbmcNCj4geW91ciB0aGUgQ29weXJpZ2h0
IHNob3VsZCBiZSB5b3Vyc2VsZiBvciB5b3VyIGNvbXBhbnk/DQoNCg0KVGhhbmtzIGZvciB0aGUg
cmVtaW5kZXIuIEknbGwgY2hhbmdlIHRoZSBDb3B5cmlnaHQgdG8gdml2byBpbiB0aGUgVjMgDQpw
YXRjaCB1cGRhdGUuDQoNCg0KPj4gKyMNCj4+ICsjIEZTIFFBIFRlc3QgTm8uIGYyZnMvMDE0DQo+
PiArIw0KPj4gKyMgVGhpcyBpcyBhIHJlZ3Jlc3Npb24gdGVzdCBjYXNlIHRvIHZlcmlmeSB3aGV0
aGVyIHRoZSBDUF9UUklNTUVEX0ZMQUcgaXMNCj4+ICsjIHByb3Blcmx5IHNldCBhZnRlciBwZXJm
b3JtaW5nIHRoZSBmb2xsb3dpbmcgc3RlcHM6DQo+PiArIyAxLiBtb3VudCB0aGUgZjJmcyBmaWxl
c3lzdGVtDQo+PiArIyAyLiBjcmVhdGUgYSBmaWxlLCB3cml0ZSBkYXRhIHRvIGl0LCB0aGVuIGRl
bGV0ZSB0aGUgZmlsZQ0KPj4gKyMgMy4gdW5tb3VudCB0aGUgZmlsZXN5c3RlbQ0KPj4gKyMgNC4g
dmVyaWZ5IHRoYXQgdGhlICd0cmltbWVkJyBmbGFnIGlzIHNldCBpbiB0aGUgY2hlY2twb2ludCBz
dGF0ZQ0KPj4gKyMgV2Ugc2hvdWxkIGFwcGx5IHRoZSBjb21taXQgKCJmMmZzOiBmaXggbWlzc2lu
ZyBkaXNjYXJkIGZvciBhY3RpdmUNCj4+ICsjIHNlZ21lbnRzIikgdG8gcmVzb2x2ZSB0aGUgaXNz
dWUgd2hlcmUgdGhlICd0cmltbWVkJyBmbGFnIGlzIG1pc3NpbmcuDQo+PiArIw0KPj4gKy4gLi9j
b21tb24vcHJlYW1ibGUNCj4+ICtfYmVnaW5fZnN0ZXN0IGF1dG8gcXVpY2sNCj4gRG8gd2UgbmVl
ZCB0byBhZGQgdGhpcyBjYXNlIHRvICJ0cmltIiB0ZXN0IGdyb3VwLCBhcyB5b3UgYWx3YXlzIG1l
dGlvbg0KPiAidHJpbW1lZCIgaW4gY29tbWVudCA6KQ0KDQoNClllcywgSSBkbyBuZWVkIHRvIGFk
ZCB0aGlzIGNhc2UgdG8gdGhlICJ0cmltIiB0ZXN0IGdyb3VwLg0KDQoNCj4NCj4+ICsNCj4+ICtf
Zml4ZWRfYnlfa2VybmVsX2NvbW1pdCAyMTI2M2QwMzVmZjIgXA0KPj4gKyAgICAgImYyZnM6IGZp
eCBtaXNzaW5nIGRpc2NhcmQgZm9yIGFjdGl2ZSBzZWdtZW50cyINCj4+ICsNCj4+ICtfcmVxdWly
ZV9zY3JhdGNoDQo+PiArX3JlcXVpcmVfeGZzX2lvX2NvbW1hbmQgInB3cml0ZSINCj4gVGhpcyBs
aW5lIGlzbid0IHdyb25nLCBidXQgSSB0aGluayB5b3UgY2FuIHNhdmUgdGhpcyBsaW5lLCBkdWUg
dG8gdGhlICJwd3JpdGUiDQo+IGlzIGFsd2F5cyB0aGVyZS4NCj4NCj4gT3RoZXJzIGxvb2sgZ29v
ZCB0byBtZSwNCg0KR290IGl0LiBJIHdpbGwgcmVtb3ZlIHRoaXMgbGluZS4NCg0KVGhhbmsgeW91
IGZvciBhbGwgdGhlIHJlbWluZGVycy4NCg0KPg0KPiBSZXZpZXdlZC1ieTogWm9ycm8gTGFuZyA8
emxhbmdAcmVkaGF0LmNvbT4NCj4NCj4+ICtfcmVxdWlyZV9jb21tYW5kICIkRFVNUF9GMkZTX1BS
T0ciIGR1bXAuZjJmcw0KPj4gKw0KPj4gK19zY3JhdGNoX21rZnMgPj4gJHNlcXJlcy5mdWxsDQo+
PiArX3NjcmF0Y2hfbW91bnQgPj4gJHNlcXJlcy5mdWxsDQo+PiArDQo+PiArX3JlcXVpcmVfYmF0
Y2hlZF9kaXNjYXJkICRTQ1JBVENIX01OVA0KPj4gKw0KPj4gK2Zvbz0kU0NSQVRDSF9NTlQvZm9v
DQo+PiArJFhGU19JT19QUk9HIC1jICJwd3JpdGUgMCAxbSIgLWMgImZzeW5jIiAtZiAkZm9vID4+
ICRzZXFyZXMuZnVsbA0KPj4gK3N5bmMNCj4+ICsNCj4+ICtybSAkZm9vDQo+PiArX3NjcmF0Y2hf
dW5tb3VudCA+PiAkc2VxcmVzLmZ1bGwgMj4mMQ0KPj4gKw0KPj4gKyREVU1QX0YyRlNfUFJPRyAk
U0NSQVRDSF9ERVYgfCBncmVwICJjaGVja3BvaW50IHN0YXRlIiB8IGdyZXAgLW8gdHJpbW1lZA0K
Pj4gKw0KPj4gK3N0YXR1cz0wDQo+PiArZXhpdA0KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2YyZnMv
MDE0Lm91dCBiL3Rlc3RzL2YyZnMvMDE0Lm91dA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+
IGluZGV4IDAwMDAwMDAwMDAwMC4uY2IwYzk0NDdkNjc1DQo+PiAtLS0gL2Rldi9udWxsDQo+PiAr
KysgYi90ZXN0cy9mMmZzLzAxNC5vdXQNCj4+IEBAIC0wLDAgKzEsMiBAQA0KPj4gK1FBIG91dHB1
dCBjcmVhdGVkIGJ5IDAxNA0KPj4gK3RyaW1tZWQNCj4+IC0tDQo+PiAyLjM0LjENCj4+DQo+Pg0K
DQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
