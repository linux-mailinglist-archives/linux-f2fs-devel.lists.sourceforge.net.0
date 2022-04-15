Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65247502746
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Apr 2022 11:20:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfI8E-0001cO-R9; Fri, 15 Apr 2022 09:20:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaitanyak@nvidia.com>)
 id 1nfI8D-0001cD-2M; Fri, 15 Apr 2022 09:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KdzVxQLhOIzwO3EIom1scI2CEKlGZZ29ZfmeWI/0Tzs=; b=W8SwDrn3au2Tb/Y+yT0yo2SOJQ
 +kbqPmuPkEZv0txz0F/6xAVJKVek8mbmF5shJHPO+Cc98FD9Op9JLpZCMX+kQVaBe8vF7s6KG1N9B
 vrn4ct5BGRvmLx8AzwPSG/HByRzk/aNueU+dNSGHm0cHbuZRtXfx/ULHsPNlFt20ku7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KdzVxQLhOIzwO3EIom1scI2CEKlGZZ29ZfmeWI/0Tzs=; b=LHhKcXSXIUIe6lIbn90pivdUYY
 OChfAtHF/YUVGNciB7CxoyH/uBfWFbd7RZ8mcy5gDL9BTPgwl/a+wA/HYi2jJISWTv+ibz6bmmgeR
 A6QY/oAJh6iZ9EtWl0QIMuCryI1GkoD2v2aqEU+LDG9UJv7yDQFvrnUBTu0F6Aie0Nd0=;
Received: from mail-bn8nam08on2071.outbound.protection.outlook.com
 ([40.107.100.71] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfI85-000I8E-Rz; Fri, 15 Apr 2022 09:20:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nE4sKdPGoMABYZ4kAMLAh3jVni5uF+yjcAUUvY+7dljSFk1iu/l7LoEHsL8JAltU4GNvNuWw0O0Z9+OYtOe8MQu5IA5bcDlLOU9wQ0HumHQIF2vPzOtnzLJz2A6JUj4jmsTEZCtZXSNDEXp4Ov+SFMhUyAdYdaPf+r3NEwJc8WmOXZ9gHzncTvxphGmPelLoofjND8YGsH+4QjBrTvHqT2sTYGrcqXIWxFUhEGP8UX04mHTu38x0CG5cTN68fPbpSBo4c+PVePg74x0ZdinVtTe3BILAhn6pVoXT8MfN2vyKsUghPYg+g8hkgjaq37eli8KMDo4B+gN1gKMRcfmzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdzVxQLhOIzwO3EIom1scI2CEKlGZZ29ZfmeWI/0Tzs=;
 b=So/eo19GlMrFYLgo1xaGggzFalmv8kNy1r34JUwZQoMCp9ZWiiBkWalID8+uinkoQNVLiES1NxF6rNC+CAjHaJk5p4+IdiTTpUq0e1jhXIRJFCvcdsFYW603S2aHAB942QDYXrCO5pPXSeaAgnDjKHEnMtTO+O5oqZ9zN2SNYRuoYJIqcvvPs+3eLDICIWswDWEvdE7yX6yG+pOwJc6kZX4LqPpZetKx9nGpGEfDrkZKhjI8qtj28qaSmx+vwyMcDP5rFhMOOs1W9Py3dLTuaPp+XAl+EmEcaXQtBEMDQjvYOweUfZcYa1jdYJEVDugGNah766Gey8FP1boGMjdw5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdzVxQLhOIzwO3EIom1scI2CEKlGZZ29ZfmeWI/0Tzs=;
 b=HAcwx2b4PXoa4zPnYgVIEbCtts9d7sVBpXDyaHqzXDR3VcfBub5R72rObkzotyIEJEQZMAdvbp+1UZSk6FYN2tvzBxBnun7v6RbD1qVyNdK2jdYsj3VJCL+Z4Y0SlfFLbZG1wsqKrRMUAdKkvc+U74nFHzLFwRepcSQh2PDvgynZ+6bg6fY8yYRtAC1ZCJlFp/971+W+s0PcBuS+dZzi89lnlBKfbMbxYX8hRxKMl5x3pKpTZPk/jNyslSRVFcIzJ3B9uMiG7HvVKDBjo7xdJ9yx9ax333Aj4goLKBrY97BONbulZtk/giNDMNXel1JnkyeQ6N2IfbvX3nsw9+ngtQ==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by DM5PR1201MB0169.namprd12.prod.outlook.com (2603:10b6:4:55::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 05:47:13 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 05:47:13 +0000
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 23/27] block: add a bdev_max_discard_sectors helper
Thread-Index: AQHYUITqaOcsO5gg2k+4WC+bePE7r6zwd3cA
Date: Fri, 15 Apr 2022 05:47:13 +0000
Message-ID: <3583727e-1260-0907-1b18-cad774750ed0@nvidia.com>
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-24-hch@lst.de>
In-Reply-To: <20220415045258.199825-24-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b895042-ef19-401e-8e43-08da1ea363f5
x-ms-traffictypediagnostic: DM5PR1201MB0169:EE_
x-microsoft-antispam-prvs: <DM5PR1201MB01694CAD0B3BD74D7D4B1F4CA3EE9@DM5PR1201MB0169.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KSrPFGpoP9v40ktuShVXOU9KDNwv6XMxXqvafCumrfEP/nwLBaXfspxM+boucxgrDcsj/8XwlaQFjO7+BpocTlRbDdUNJM8wd6gmFwBiQDVugRc/j+gJdRmBbpsWXRPCVyhemC+W55DUoYOY6erm2JxtW0Xa2Vwyvvh3QJ0M/7QUd/CilYqG+8M/z+9MAicCBmB5gA6CE2DFZc7A4LOL1eILj7eA2+AFFE+vdNfc3RvrkmYaozYHNqLPZ41X3c1m+/AIUtAoLpV9Ddxvs2gijOQPD/bjbHrdiayIQADxTMNv+noNS1FjzOlp+uuHXWb66bUa9ef86Vu6TG5mXVBOWPjACx5XrRQ8r5tfcirBvMYSXejuVDw2JuKDZWfPDn2P1lZcgeLvDfsK4LtvWJ0TXoaaGeI0GhqLr6pJdG5S9x1JYr1ke5P8upOHUy14kCLDqk8s+lmEkhKM0fI2H206UySO4iPs706GoPRJbS39EwiI2le2vjhXDZlHn6FZ+f9Cdn4KV9kUMP6PRZ5kVH6U6OT78DJqqZZkzAQdzmaTnKYDbfhoFHt8JQod45yAyIGlGzht1sQ8GPDUEFNNdOkbaD6XWb3ooshOCWtlaKiMtdrTfC1e/o9yuFrScsQgEDv5ql+6/ZdDky5daEoES2X78q27h1efGG5xI1ASD2Sab8pZsJ6bxp5k0AmFhmxMnklmfxeP7deAjoBbmR+fD+G6yknzBIV3T8tYwcNOhV6jdtBzUkY8Mlt3FDoLcHvVTVYuoftH6Wb7L7AwHQzjkoCh4w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(110136005)(71200400001)(64756008)(8936002)(83380400001)(4744005)(2616005)(31686004)(2906002)(38070700005)(316002)(6506007)(53546011)(6512007)(66446008)(7406005)(122000001)(186003)(7416002)(76116006)(66476007)(66946007)(91956017)(66556008)(508600001)(36756003)(5660300002)(54906003)(38100700002)(6486002)(66574015)(86362001)(31696002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YThWcXFiVzBaMnh4WGo4ekM3WjhiemhHT2JwcmpQS0laYnd6bzBEc2pHNFdj?=
 =?utf-8?B?WnhMVzdiZklQMkZxYXVaM3d5NGhyUDhoU09FektZUkVBeklvU2o3Y09lUXVS?=
 =?utf-8?B?bmloUzVSSThVanJjVC94enZjbzJ1Q0ZvcE9EMkxNS2I1L2lka1JNT2F5a2xa?=
 =?utf-8?B?SWZOMXlXZ1RzQ2dacnVLNk1PWk55a2xVcFZjUGQ0SWVoenpIdmt6WGVheHRG?=
 =?utf-8?B?bE1RazJRcmpYdk02c2srdzVNb0VHM2l4eFJWTEVjVkRBQis3WlZ1dE43TEJ4?=
 =?utf-8?B?eW5UaFdUY2RZeS9WSEpUZTVMT2M3ckxiOFJXdHpRMnpKTlhLMU5rVnlmQzVO?=
 =?utf-8?B?SUlnNVZsNS9lLzVyZ0lzVXlFK3Q3RExRSVlvcG12K21NclFLUXY0T2FRaUVa?=
 =?utf-8?B?ZHRiVUVvbUN4R3lLdlJuNklQOGlTblp6aWpselNrWUpEbXV5SklvdkdnRXZo?=
 =?utf-8?B?bnl0WWtsRjkyTS9zNnNNMzBwT21sK3Jsamdyb01DNnJObGsxMC9QYTNlQXVN?=
 =?utf-8?B?ZXJwZmp3UXN6ZWxUS01YcStKN3d3Sm1QUHRaRG1Xc3I2VWZodzJ2bEhJdlBr?=
 =?utf-8?B?T3dTbnJsYXJjU2xGeHBiNTdSM1d2U1hnbmxidHdBUUNCNlhKcnJXOUllZzhP?=
 =?utf-8?B?ZTMyc1htWlhuSWkyVklwN0lTaXp6c1FMcHhCdDNMZjR4b0VKdzdBS0lkSnl0?=
 =?utf-8?B?TE5PdTF0eC81Y3plN1kzUitvSFZadU82dW5FL2Ywc2FaSWE2Nkw1Z2xRNFE3?=
 =?utf-8?B?UXU0b0NqV3pGbG9raHBBckVHN0tpODJsR0p6QzRNYit2ZllzZW5VeTVXMTdp?=
 =?utf-8?B?dXRQRkFTVVhCMWZka1E3K3hJa0NiZStrbXRGaUNwNUExZC9uR1FWYm96UXJF?=
 =?utf-8?B?cExDTTlleGE4QnNjTXdVOHdzMkJBR0RhTVh3RHB3dTl2TTk4YmxDVjBneFkz?=
 =?utf-8?B?MlQyMlRrcElvdGt6Qk5TSmQ4dDg4a2Nvejgrd29hL3RGUTVVRnYxcGFxQ2FZ?=
 =?utf-8?B?QTBQZWtUSUxZTGFHSGRLN2w2VnBJQlRubEhQcVFmT1h0c281am5yN3ppanpD?=
 =?utf-8?B?NWpVc2tzVTZkdHh6VDA0VlN2WExaTFRGZXhMNW5YMlUveWxzN3g5QUw1SHhh?=
 =?utf-8?B?VUJqQWlYZ3oxTjJ4Nkc5c1Mxc3ZiQkcxUzVKUlNUaUN1Y3N4OTJoNkdIbHBn?=
 =?utf-8?B?WkZ0SGV3UTJFVWhVc3hkM3NNUzNuME9LUWVsWFpQR0J2dGwzTUFtdmtFTFNx?=
 =?utf-8?B?ZkVTUFBrU2tsczZoNTcvUWNDWU9GU0tWaERWanNWM0toZXNWZDZpK1lyV1BP?=
 =?utf-8?B?T3E5RjQxSHBwcmFCeXFZZGRPS3JnM2ZuZGtVUThVLzJrb1o0Mys0eEtscmZ0?=
 =?utf-8?B?azY1cVFDM0JiTW1zYnFaR3NyanZTNFJNdDV2Yyt6Q1dMaCttYzJweFMrdkh5?=
 =?utf-8?B?VGdwOSttL0ZCblRWK2treUhjSWlYaUp4bDhnYXB3VFJoWW43UGJvWlZHYzBG?=
 =?utf-8?B?T1lDRTY4VU9RVXBScVMvb2JsU0kyZFp3VCtMaHk0T250YkM0OUtlckRPanA2?=
 =?utf-8?B?UCsrdzQvNFlLTlZ1M2NJUU5MaGhsTm9qdUdSMFZibmhGaEFBQWtyb2RZR1Y5?=
 =?utf-8?B?elRuUlBET1lnZFdXSXoxMit3S3Y4R0xabUtJVXNiVUJBc094VEpMSjdEYURt?=
 =?utf-8?B?MGpKc1YxNnJLNVR2REZkdHp4bUJpeUQ3OWRPYm1jTTFhN1l4bWRNUUUzL2Vw?=
 =?utf-8?B?TWhuRDYvRTdGT0FockZOWUNXTTVYNHFkMFltc01KcDNrU2tVVkIrTDcrcEsy?=
 =?utf-8?B?LzFTeW1qU21FZEVmL1Z2cjEwZGkzeTMxTndYb0EwNFBmUUwxT0lxQ0lnOUZR?=
 =?utf-8?B?ZXBBNWl3TXkvVzJFN09yZS80TEx6eDJ0bC9KaUMwd3poZEtuMXJkOHpadFBJ?=
 =?utf-8?B?OUJEQ2xteVJWVmdjdXNLbWd2RGpuYzE2dnhVYk9SVHZraXpKcllpajE4bHhi?=
 =?utf-8?B?N0UxR0VWdkxPaFBBbjl5Uy9QTkNWaDA5YmtabStmcDZITnFXdk9pRk85c2hl?=
 =?utf-8?B?b1R4QnNiQXRUSzJ2c0pVY0UzNjJMdFBMOWp5Z2hKblpKNDVweU5UNTN5ZVlW?=
 =?utf-8?B?d0VQQWJNVzF5eEFaVXA0elA5aU1QSUFyd0l4REFBbW53SE9UaGt5SDZlYXpG?=
 =?utf-8?B?WXJuYXg5UWcyNHlkRzIyZ2trWG1rVTdEYS9DRzRLb0tMK2tGNEpkd2tDVmVJ?=
 =?utf-8?B?SFQ3ck5QVzltQ2JISytLc3ozem9wek5idk9WRVZSVlJ3OU5ZR2hBOG1BRndy?=
 =?utf-8?B?UHNCQ0tuMUdGNktQNkJnZHBmTTJZUmNROG9PMmxUVHRiQUdpV1JwVENrNDlj?=
 =?utf-8?Q?ptdB47J/J7pYwwdQ=3D?=
Content-ID: <198DA0096D964E4496BC8D9005BDA9B4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b895042-ef19-401e-8e43-08da1ea363f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 05:47:13.0323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GiB+aEF+f3GHt3hruWQXkleGZf77t7VfkqUEj/ZcZKs3RBHclynXamevo+pJNjR5rzxg9sJhxUY0a39YMer1cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0169
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/14/22 21:52, Christoph Hellwig wrote: > Add a helper
 to query the number of sectors support per each discard bio > based on the
 block device and use this helper to stop various places from > poki [...]
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.100.71 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nfI85-000I8E-Rz
Subject: Re: [f2fs-dev] [PATCH 23/27] block: add a bdev_max_discard_sectors
 helper
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
From: Chaitanya Kulkarni via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: "jfs-discussion@lists.sourceforge.net"
 <jfs-discussion@lists.sourceforge.net>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 David Sterba <dsterba@suse.com>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Coly Li <colyli@suse.de>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 =?utf-8?B?Q2hyaXN0b3BoIELDtmhtd2FsZGVy?= <christoph.boehmwalder@linbit.com>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNC8xNC8yMiAyMTo1MiwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IEFkZCBhIGhlbHBl
ciB0byBxdWVyeSB0aGUgbnVtYmVyIG9mIHNlY3RvcnMgc3VwcG9ydCBwZXIgZWFjaCBkaXNjYXJk
IGJpbw0KPiBiYXNlZCBvbiB0aGUgYmxvY2sgZGV2aWNlIGFuZCB1c2UgdGhpcyBoZWxwZXIgdG8g
c3RvcCB2YXJpb3VzIHBsYWNlcyBmcm9tDQo+IHBva2luZyBpbnRvIHRoZSByZXF1ZXN0X3F1ZXVl
IHRvIHNlZSBpZiBkaXNjYXJkIGlzIHN1cHBvcnRlZCBhbmQgaWYgc28gaG93DQo+IG11Y2guICBU
aGlzIG1pcnJvcnMgd2hhdCBpcyBkb25lIGUuZy4gZm9yIHdyaXRlIHplcm9lcyBhcyB3ZWxsLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+DQo+IFJl
dmlld2VkLWJ5OiBNYXJ0aW4gSy4gUGV0ZXJzZW4gPG1hcnRpbi5wZXRlcnNlbkBvcmFjbGUuY29t
Pg0KPiBBY2tlZC1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxk
ZXJAbGluYml0LmNvbT4gW2RyYmRdDQo+IEFja2VkLWJ5OiBDb2x5IExpIDxjb2x5bGlAc3VzZS5k
ZT4gW2JjYWNoZV0NCj4gQWNrZWQtYnk6IERhdmlkIFN0ZXJiYSA8ZHN0ZXJiYUBzdXNlLmNvbT4g
W2J0cmZzXQ0KPiAtLS0NCg0KTG9va3MgZ29vZC4NCg0KUmV2aWV3ZWQtYnk6IENoYWl0YW55YSBL
dWxrYXJuaSA8a2NoQG52aWRpYS5jb20+DQoNCi1jaw0KDQoNCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
