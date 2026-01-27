Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7nKNM5NVeWk8wgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 01:17:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 778999B9C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 01:17:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eor1HXJ+wzTyVatA5fn2AMnkB0YQlprswk/G/gCPvSg=; b=mXEuTXxGSk+s0jrbaVkptNEjKx
	6yhDPbO3i3O+3zYL4CBUActZTNoC6ZD8CmwrzAdMB7abiBQbQguWUAwK82JeXIJgzfOa7F/Pw+Oj1
	3L3dlu9XpxhnDdrzCflX8vpZ/STfXtGEP/oHOhKZLGQPPUn6GdT9+Datjo4k5LSm9xGg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vktFA-0000Qp-Fk;
	Wed, 28 Jan 2026 00:17:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chaitanyak@nvidia.com>) id 1vktEp-0000Py-N0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 00:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ayo3ki25oRkTCIe4bxy1YMh65n692UQotlweYc512sI=; b=JIWrDp9FeMf1+rku5h+Hng49mq
 Oyjc0hNg4hry4b/av8LVAp9MZDkwebrSP4Ul4jaGx8TxQu7SoVyyoqbrWrMke5JkA8FX3g5+okM3U
 IA/t89/2H+vlI2noRea99PH44F74uFxr5ybpQwjp1N8nw4hsyIllwM2CJ15Y0WkrwOms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ayo3ki25oRkTCIe4bxy1YMh65n692UQotlweYc512sI=; b=E0M15k6PtUIvdbRHjdmhmZlYZh
 yeW2L+lQjQvJu/zfcX6+10/cr2hDCslCn9HyRBcXXLxwp0RQ8+jjVaeH2G9fz59fOihMDaRpO0oZs
 +KV3o752e7BC64ySY2jV9D52q4GWDlOQ3aMDaEaZy9gTIYfNP3mOo2vKemj9hknO8H3g=;
Received: from mail-northcentralusazon11013066.outbound.protection.outlook.com
 ([40.107.201.66] helo=CH4PR04CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vktEp-0001Rj-3H for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 00:16:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrJe5y/YqmCyIZMkMowyQnfrZudNiapZOfQ2+ZBRxC6W2Ne5yag2WJbknY55Rlv399kRGgDMNUWBQ3NbzjdaYoynD2CBDJM8Xdd4Vt1Flg2PhzXo1sr5Xz1+x6RwzuZo6IZpK2PGuxHEjxHkQ8p5vH5BLeCJ9l0T5tagaefqhESFLZgLKkYYEZFr3DuOtkay6LSOT66K+QCo84/VAcv6SVAH0wABVJyUYiS5nHq2uf6+o07PPt7nsyJIKRkPzPe7sGN6BdZv3qnyjy2zZkV6ghtykTwLzyEdR6IPQ0ifd59LHEhQ/ykxM2Lb7COrq/CzAljdfWLxB3VljtFDYXZiSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayo3ki25oRkTCIe4bxy1YMh65n692UQotlweYc512sI=;
 b=CurqA+zMPThA1GqsDpzgC86+n1kRCEPNxr6Kiekt2KPSmP/OxePpUKkPUo1Zn4rSBNv2OQS4oNMphfj9XSl/rmrHLEnuHJJLOsmFB9ilWMuO56d7JPKN6bIZl/ofKZKB+ZiEdEcfg/SEXuuwGg9gWeUQqwGiC63e646p9FL3luVkn3iBx3lwTQwbZA1/JCjaUkonk4IdF+vlcRNO6Kwm0tl/oybnm0MHDa8GVIzEcunHeurJzVrjNDwRYJdoplYw0s4QtY+d1Q//gQWRos5Mpx2nYmvhCz7U3th/pkF4Ey0W/3at4QvLh9rO59IqZp/yoRtvVv5446Dw8gd7e7CfRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayo3ki25oRkTCIe4bxy1YMh65n692UQotlweYc512sI=;
 b=FuS1I1tc8Ei0bnWaVBEiH7hWztzgQqR56FS5vQQ7WIR4MTqxNQePqLWQX/T4mrb4IywhTGmzfnQmPd3SNgfoTsa1BeHruZQVeFBTe+Wp/keH7MWTFXal9jztBz5q07kbskEw/8knvGeoo6SN9SyhgtbxZtQESlt/8IfuVw/QAJFBq+cHmzBo2UTDdL6VqUFf4xWWuqj+3jFGNHQ+8aPpFstYH3Eyc+QkUXnLxJO2+y1bbT23ciLzT+Th1MbSkYVNRtL1BvGIUTDER/M9iSffzA3EDP9rKj/+kj160LO1Om0d/hc8XeBwArjdnRkR+nR62KDOfGE45ydJ8Mo5R20+Eg==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by CH3PR12MB8879.namprd12.prod.outlook.com (2603:10b6:610:171::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 22:40:59 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 22:40:59 +0000
To: "hch@lst.de" <hch@lst.de>
Thread-Topic: [PATCH V3 4/6] nvmet: ignore discard return value
Thread-Index: AQHcXZzXDfTSuV3W4kihFfciFgwCxLViN28AgAIN0wCAArt3gA==
Date: Tue, 27 Jan 2026 22:40:59 +0000
Message-ID: <5bbe8ca5-8689-4c1c-a601-4704770850e0@nvidia.com>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-5-ckulkarnilinux@gmail.com>
 <942ad29c-cff3-458f-b175-0111de821970@nvidia.com>
 <20260126045716.GA31683@lst.de>
In-Reply-To: <20260126045716.GA31683@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|CH3PR12MB8879:EE_
x-ms-office365-filtering-correlation-id: 7e8ef64d-8340-40af-dbc6-08de5df52480
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003|7053199007|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?M2MwVTBkeDBUdTMvVXFHLzJES1piM0Z0RHU4Q1BCcHhhYVcwNmtpeG5randn?=
 =?utf-8?B?MGQ5MUxCR1NaVlJJU3MvcVF1VjA1MDdmaWs0b0JSeDB0dHlTODhtKy8wRU51?=
 =?utf-8?B?c1lIQXVhNE43WkFyVlMya1RIeHR6VkxWYkVPck9ETm44ZmNvRmJqZWN6WWhq?=
 =?utf-8?B?eGE2Sk5vVzQrSVlGMHh5bXZ0cEtkQStEVzZOWVFIM0pMREFFWGg3T2lHdjl4?=
 =?utf-8?B?UGRaNERZQ1hIMkdTYTRaRVk3bVlYMmRRZHl4c3RjdGV4cmgvTExxeTJqQUxL?=
 =?utf-8?B?YzZ1b2RqaFJWY3JzTUh6V2c1OUNZdkNNVGh5QmVYYnl4QmgvL1QvdlE2di9r?=
 =?utf-8?B?Wnp1NkVwZUNmMi9qckVlbFdqRlo1VnZ0WFpMdTF6ZklQVS9mREpqMHUvYmVr?=
 =?utf-8?B?dlVsNTIzWEVHR0FFU0o3YmhEaDhqM1U2R3Vkc285Q1Y4RXAwbHVpMi9LYzBy?=
 =?utf-8?B?cGRLN3FYNDFIUUtUQ2JhTDd0R3FkOWIvQm5FVU5BcGxyUlZXcGlwKzFzdjV3?=
 =?utf-8?B?SFFlODNzNXhXVHlrT29XWE10ODlVaFRad0Z6NENxVlIyMHNtVmVMckxjeTRB?=
 =?utf-8?B?NHk2T0RxcHpsVUs2Ly9Yd1A0bEhLMXVpMjY0U1ZPdHM4bXZOMTJHekZaTERi?=
 =?utf-8?B?QUpPVWszdmdFLzN6R1ZvNm9WWThHalNXRlhKeXhEMzlreGJwaHBoVVBqd3dN?=
 =?utf-8?B?czJZRkg2b0gxOUp3Vmd2dzNtbTk2SEJmWXhsQm81WnpxcXdMRnJhcnVVdzha?=
 =?utf-8?B?ZEs3VTFkMTA2THpOM0hZdVBOYUV5TW92UUVvaVhnMnBkREFJRWIwWHIrTkZv?=
 =?utf-8?B?cDNDcDJ6QUloRllyN2ZTSnc4SGtTei93TllhZVR6YW1hWlJ3TGJPaUZ3L2Np?=
 =?utf-8?B?Ymg3WklmaGljQ0xGV0VhUUhkbHJEem5LaDFpRWZ3anUxMzNhdGtIa0wwejdC?=
 =?utf-8?B?WjVCbXFZR080ZzZGaGcwOHRCenpmS3hDZFRtaVRlZ3JDdFRZVkFzM2RFcCt2?=
 =?utf-8?B?eXQwL0N1NzlMRmpSUXo1TS9ER0k5Qy91K1k0OEc5RnZCMzRKSU1jbVdqUG5u?=
 =?utf-8?B?UlNkb1FTYWIxQ0EvRExrSlJBQ1EvNENIOTFHQ2tiZ0VlTlJwWVZ4U0ZnMmVL?=
 =?utf-8?B?T3hpaWdLS0poQzduWjNTUExQbCtzb29WZWpITkZ6MDRCcjRvS0FpMUZod2Qw?=
 =?utf-8?B?RGxwMGFQWTFua3pENk9laUphdndXVVhqbDFlL2g3YXhBSUlWbHBnOGgxelAy?=
 =?utf-8?B?OUtzT3dEZ01QakN4ell6TVlyc1pUbnJ0d1AvenJPajBNdzd1TUIyd3dubUkz?=
 =?utf-8?B?ZUdCMHFMRFc5cFBhNkVqOU1PZ2FzTnZiaFJFSHE1bCsydmtoMDRlVWFtam5T?=
 =?utf-8?B?WkV0d0VNeU91SUtZN2RySTZiRzZvNDZtWVllV2VXSG1OcG1MdElkNGdzVVFp?=
 =?utf-8?B?a0ZHWUNKbDFLcG1hV2pRK1l3OWxWaVhsU3dOT1doYlUzZlJvbWprYUxUM2VT?=
 =?utf-8?B?N2hiYTJBVzd0R2lyZG9yUkFqa3NFUnQyb080bVNwL0d2TVlOY1FzVG9uN0d4?=
 =?utf-8?B?cEhkazJJamlHdjEweCtBUHVhRXhLZkFjTHZFRFdsVWoxODNXeWo3YmlndXhE?=
 =?utf-8?B?UW5MNEV6SENHTUFQdEdnNTJwdmYyR3ZvMmhkaS9ZUHdlSjJNbnBHdm85L1Bx?=
 =?utf-8?B?UWIva0FrZDdKcy9QSjZLOFFqcCsxTWhmd3JHdlZ2MW9rTHQ0SnYwUGtnMCtv?=
 =?utf-8?B?YlQremk1NWgrOGJMbi9Sb1R4UWQ2MnBWZDJoZGFFODZMZHZLTjNVYVhscEYr?=
 =?utf-8?B?emJwTG45TWdsT0NRSVFkZG1jTkdDb2ZpaDMrcmtiZHZEU051T0YwdXJWUGxr?=
 =?utf-8?B?UTdoVTd5RHN5dFVqVDUwR0lOeURQVU5McmF6QVBMb1NNRzNqbm1ZbEhzUXAr?=
 =?utf-8?B?MG96Y2NRTFBWaVVxODlyR0IxMTdsVGVHb0RwelJQTzBHM3Z0THJWamRTT0FP?=
 =?utf-8?B?Y3F1R3FKN2hMRnNSZTgrVUZJWk1mMC9XSEhHT29Wc2EwL2cyRWExdmF3MjMw?=
 =?utf-8?B?SmJ4SDdpMkl6Qm1rVjRYWkd0MU9GRWV1dTUxNFlqVGZTUy92Y0xZZVMxUWwv?=
 =?utf-8?B?R2xSUk5nenM0SW5XL2ZHa0xEUkQyM1JYSWhzTnFHTmowcmQvMmxYTUhRbE1R?=
 =?utf-8?Q?vwVfXP1muawfoxEaI4oXX9w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR12MB9404.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bERZU1JCR0R3aEFaS1ZrZTVDSStVRWFheUl2U3JxUnZ6OUhTL0x0VjMzcHFj?=
 =?utf-8?B?SXcwb1dnRWpXVXUxbzdTaTFIcDF1MzJZcnl4QzRoRDkwa3d6aHI5NlFBRlg3?=
 =?utf-8?B?L20vVXRYbEpCMzFOUmVSWUZOaktoeWw0bTF1TWtpUjVneU1WalUwR1h3ZXUz?=
 =?utf-8?B?YTAxVmJDa0FNSTJkc25EY0lGUXkvZysvU3d5VzV4V0xVWStFdkE5dmVBOHB0?=
 =?utf-8?B?LzFSNkNhUHlablg4N0NRTGxHaWxMUlg2R2JSL3FOd0E3WFNtTWlIejBzY3B6?=
 =?utf-8?B?V1NFekhvR1pWaUIrYUhvbDc0Q0ovSzg5b0d0azNXb1Q5RmxLdTU3NS9jakZH?=
 =?utf-8?B?S29HMm9ZdnVYcDVNRFFwVnE0cmlvazNQalZrOTgrWXR1SmdtR2FzbWZNdGtW?=
 =?utf-8?B?Tjk4Y2l6KzdtQkJKaG9rZ3ZQQkFKN3A3OTl3VURMdEkxS2V3SFJsMVBnUmw2?=
 =?utf-8?B?b0lmcmF1eTl2enVQU2M4UWd6b0RxSnJIVnpwenB1Q3d3WUJBaFdwaVhjUHBC?=
 =?utf-8?B?eDk0VXVBNWxoOEdXdTlPZERieW4zSURyTWxTbGo4RERNS0VjYjlhbVl0N0Nq?=
 =?utf-8?B?cGN3emJOcFJ4MzVzZ3p4MkZLNndHWWpmdnVXV0J0UDF3NUNhc1MyVjA1UjdW?=
 =?utf-8?B?OGxKWjZPMkhVaTJ6eDdwOWVzWmVJQ1JwcDZYQXQ1K2tQdi9McG5rRFR0alRI?=
 =?utf-8?B?MmZPNDJvZTNhRHErTksxUVEvbzB2dnlSZEFRTWVKZVBnR1pJckM4cno5ajVR?=
 =?utf-8?B?Qzc5b0RwMkpRR3Z4eGJjeUZZVUxXYUJob3NHWjJhQjhrNmlNbjdUSGFxRGRB?=
 =?utf-8?B?Q3JxNHBSUEpLMXRMNy9tYWg2VlV3bUdxcUJNWHZLSHM3c0RlYTBOS2xoTGZS?=
 =?utf-8?B?aUFWdXluTWVGS3doazFzWnFsUTRYQWVCU0k5aGttWnlRUmw2K0htSzZZdFg2?=
 =?utf-8?B?eXhJVXdITm1FRnVPZmFzWlExUTY1RFhGVEpqamFLQzExU0N5WWp1OG93c1Vo?=
 =?utf-8?B?Z0NJS01UQm1EWHpEWGZrdmdXU3k5SnVlWWJHck9SbzQza0FwdWc5bDdwSVlr?=
 =?utf-8?B?d2hPZVZtTkoxcTFnK3VKOVpFaWlWaUxGWEpYYURmS0RoMllMQ2ZyMGUvUlZ4?=
 =?utf-8?B?YTFLVmVGdkx5Y2RFU0d5a1NOaHhKWlZxMVpoT1ZPNWZlU0NQOUJ6bldlK05z?=
 =?utf-8?B?b2FTbVBUUFN5OXQ5dHI3U1Vjd293K3BUU2ZEM29Tck1FbVl5TGVPb3hBZHJM?=
 =?utf-8?B?bjU3clBUWGlkQXhsNUcwMlU3aU5QdU5rbCsvRHRnUUt1cWp5bmZwVHAxYkpu?=
 =?utf-8?B?K1JNMTluTXlLWE4ycXNNdVlmNkVzcWNSYmx0VHRBMGhnbUptTko4TGlnUFZJ?=
 =?utf-8?B?VjM0V0hyRzNuTGh5QkoxWk84eEMyaUNXN3JTT0tIV25pbjZIanhubEVqVG1u?=
 =?utf-8?B?VGZNcS9ja0ZxZ1ZWNGU2V3J3d0YxZVZDODNNWkRjb2xrMkw2bnhLV0tFb2Zr?=
 =?utf-8?B?NTB6MWFxcm5RaVNkSHZubmFwRWRQN29yQzhlb2VpZXFoMFg2dHc2NU84SFgr?=
 =?utf-8?B?cXB3Z01DdVdwVXQ5cWpETjhBYm1MSmRjemkzSC9ZY1hiODR0aUpGclBibFB6?=
 =?utf-8?B?cWVTWkVSYjZuQ3VWRlZjaXJrY0dvQ09rb0NaR0NrU1ZCREkybm9xQ0Q2Y3ZJ?=
 =?utf-8?B?VVBQRm1JYjNJYVZpS1ErLzFlYVZDa0lkbTJXZUxRekVIVmVMdFhheUtaMm5p?=
 =?utf-8?B?eGpLQUdnYUpTNGFSR2ZRNGIyWGRRZTBIbDQ3QVBGVk5TU2xIdWtLWGJiK25Z?=
 =?utf-8?B?bTVPeDJwcUM3dlpVRmpjRU5MTjZ4YWt2NlcxUTY5TjVTL3pnNnY5cGM5MEVl?=
 =?utf-8?B?N2poQk81YW1qN0xHWnRSNGk0SkJIdW9wQUdLdCtpK2o5ZGs5Zi9kcDNQYVdY?=
 =?utf-8?B?dXVNN0pJd1FlOS9ndkZMUjY4RUhoeTEyODYzLzFyYkRKNFM4T3lackpqaG5k?=
 =?utf-8?B?M3JMUTZhNXA2V25wK3h0eXNSY1Rtc3g5K1NXU0lsbExXaWU3dnFrUnhIUFo4?=
 =?utf-8?B?N2JRcEgyOVYzTFF4aURSQW11MUdxYXc2VnBjYVAvRFVtK0xVelBKYnowVGp0?=
 =?utf-8?B?Y21acmRod0lqT25STnNqTkN2dlFyZlRaWlhWMXdWT080UFdKUURVVW02M3Y5?=
 =?utf-8?B?M3Y0YXAzQzFBZ1BCS05JclV4V0p6MzhJa1c2dldGSHFKMW5OZWxZRm1qMjc5?=
 =?utf-8?B?aDlHUUdJVTlyL3J3c2E2bzFjelNFOWtWeS9ESnQyKzkwM2hVVHJQYW55Visz?=
 =?utf-8?B?KzF3bHI4VDFnaFIwY21vUXA3MHZpZWNJeWlaRWV3OVBZNDNqQnF3TndJTXQw?=
 =?utf-8?Q?WhtxBMF1xuIwLJFRavaYSSUzrnCfH2FyfqJsvNELyUgpS?=
x-ms-exchange-antispam-messagedata-1: ijku9bDL61L3MA==
Content-ID: <9B49726DAE586740BB49DC6C53FCC042@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8ef64d-8340-40af-dbc6-08de5df52480
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 22:40:59.3512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 33zZZH48bAQaLgk/LSpHMtejlz12eYNomII6aD8vKFHp0NohOUhEJhOq8LsuLXU5UYPi0fMxuwGlFnBtpI15sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8879
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/25/26 20:57, hch@lst.de wrote: > On Sat, Jan 24, 2026
 at 09:35:16PM +0000, Chaitanya Kulkarni wrote: >> On 11/24/25 15:48, Chaitanya
 Kulkarni wrote: >>> __blkdev_issue_discard() always returns 0, [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.201.66 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [40.107.201.66 listed in list.dnswl.org]
 0.0 ARC_VALID              Message has a valid ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vktEp-0001Rj-3H
Subject: Re: [f2fs-dev] [PATCH V3 4/6] nvmet: ignore discard return value
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "sagi@grimberg.me" <sagi@grimberg.me>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 "cem@kernel.org" <cem@kernel.org>, "snitzer@kernel.org" <snitzer@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "song@kernel.org" <song@kernel.org>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 "mpatocka@redhat.com" <mpatocka@redhat.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "yukuai@fnnas.com" <yukuai@fnnas.com>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "agk@redhat.com" <agk@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-raid@vger.kernel.org,m:sagi@grimberg.me,m:martin.petersen@oracle.com,m:johannes.thumshirn@wdc.com,m:cem@kernel.org,m:snitzer@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:song@kernel.org,m:ckulkarnilinux@gmail.com,m:mpatocka@redhat.com,m:jaegeuk@kernel.org,m:bpf@vger.kernel.org,m:yukuai@fnnas.com,m:linux-xfs@vger.kernel.org,m:agk@redhat.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.dk,lists.linux.dev,vger.kernel.org,grimberg.me,oracle.com,wdc.com,kernel.org,lists.infradead.org,lists.sourceforge.net,gmail.com,redhat.com,fnnas.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,Nvidia.com:s=selector2];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chaitanyak@nvidia.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,Nvidia.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:replyto,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,wdc.com:email]
X-Rspamd-Queue-Id: 778999B9C0
X-Rspamd-Action: no action

On 1/25/26 20:57, hch@lst.de wrote:
> On Sat, Jan 24, 2026 at 09:35:16PM +0000, Chaitanya Kulkarni wrote:
>> On 11/24/25 15:48, Chaitanya Kulkarni wrote:
>>> __blkdev_issue_discard() always returns 0, making the error checking
>>> in nvmet_bdev_discard_range() dead code.
>>>
>>> Kill the function nvmet_bdev_discard_range() and call
>>> __blkdev_issue_discard() directly from nvmet_bdev_execute_discard(),
>>> since no error handling is needed anymore for __blkdev_issue_discard()
>>> call.
>>>
>>> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
>>> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>> Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
>>> ---
>> Gentle ping on this, can we apply this patch ?
> Are we down to three patches now?  Maybe resend the whole series and
> get ACKs to merge everything through the block layer?
>
sounds good, will re-spin the remaining patches on linux-block/for-next.

-ck



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
