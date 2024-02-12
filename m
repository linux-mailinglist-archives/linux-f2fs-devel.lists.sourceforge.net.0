Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 695F0850E59
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Feb 2024 09:01:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rZRFD-0004sT-5Z;
	Mon, 12 Feb 2024 08:00:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=7658ef5e3=Johannes.Thumshirn@wdc.com>)
 id 1rZRFB-0004sN-FO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Feb 2024 08:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H4IWJyTah5nat89FwZvZEQUResXECi17Y9fVTfNu5ew=; b=c5JFKSK0D7TtKSgxJZf8hx4Ygt
 pqB7hNG/AB5QLWZAb5azHqvLwGENurtyqahui7KUE238s6aVzbF9GCb94D/aXMR7RpjjnZzIvcvbd
 +q2aERJrwj/XU+inZMdMzDPuA3+g4fs43E7JS9gc7itXm9x+sLesCAsS0vRK+ZEtk138=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H4IWJyTah5nat89FwZvZEQUResXECi17Y9fVTfNu5ew=; b=SLyj8JUsVmA+j4SgGvk1mxIcBa
 BMpkXfMRtR7DaiFv2gj0hzlqs0OyMUx45zvFx1uXzjLagevH73s4Px6wBrdI0DzGMCCtOdL+PT8vh
 JkrrEU0iVfnCsL4hiGXm7XUX1gbExG0VFdLYu/YF8bnWSSHK2dt+EL8L9jzYLluOzhFg=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rZRF8-0008DP-F9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Feb 2024 08:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1707724847; x=1739260847;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=H4IWJyTah5nat89FwZvZEQUResXECi17Y9fVTfNu5ew=;
 b=EH+qYJcNmRBYf7FZmtcrRR9fVQAtKnUEFve+jlr1K81sTFJX1q6KhfIO
 yuhUX9FUZp+SDhPFcRHLbCIjnGwHRJQpaj2pNyEXSsHB/1IsWjBa/E9IV
 y0VwGnanDqUYedo0vDlZ17A3LQNN4a/lb5oiqjclbTEa7/sZ6DXdRawUC
 /5mrTzSw5s32htKoSOhK5jsvKy1fCkxjaHmj5IuZPNFzeAKArVDT7+1sW
 +MvOS9+3a97XTBw9efHoT5C0nLdoYAdL65csq2Vt4SJaCrzOtTw+QOvpB
 71waAp4VmclmIl5X7omhKdJ2W+lDmU7JZgvzWGa0/noRvGmvpZ0GijEPp g==;
X-CSE-ConnectionGUID: 7lCv9ZrZTZy2x93+3krrGQ==
X-CSE-MsgGUID: SksNO0wJQgeURGuxLDBkvg==
X-IronPort-AV: E=Sophos;i="6.05,262,1701100800"; 
   d="scan'208";a="9593959"
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2024 16:00:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKURYgfPu8RtOYbJ7RLBSlRXc4TnP70JJSnoHdKOY7WedIV/4JuI9VquPTz2KV1yX7Ley2NxIiGHK4SVNMXDzVCJRl3ol4SlOBqyc6ReXJ/0QhfDs5XgCbpsHgETErmju2aLXE8Ne1xNbV2DWz8gZaqROtXXy+Bjz7F/y4Jx58bwlqRmZCgchc8x2rGJ4SrUvl9sXNc7JGgkGdFqR4y0kiMWnmuGi1cEL7v3ATPziXXslDFPLRhMNnWeAUYA4Q9cLVx0GR5trjCGYY+8PJCBoGaloejD9xcvrWN5Y4Hj4T9P8JMdVMczobpNWh/kEsUYdE6fgRroR/Rh/Nrwq7rF/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4IWJyTah5nat89FwZvZEQUResXECi17Y9fVTfNu5ew=;
 b=A49QnjsrWGC/Tlm8f64iSxBSt/LPtJgQP9U8qUjAL8iIB6uljKiDISrXQOQlfP3hknRDy/E6p7O/A2BASuUICRD4NKAiO9qM8sKxm/0DPkM2nQ9ZTQrOpAeoGN9pLJiyzSFXQueSRhGxOqwmNhHizWghnmnuZUi4zoKsnGvB9jotA6UKMXr88sJFrI5rrrvBTPC+eyJFsPa1ec0363AWS5HzQ25rol6cwC9UrpkA+nmqJz/jS/MCztb5BwWFMOTU1jzToAY2N2XasFdgC+1JKamgk3AbrFE/1TlrMzW0vg9maebwMpkymOZI2JEdjahqiCtMbEToaixKAJuGLFBO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4IWJyTah5nat89FwZvZEQUResXECi17Y9fVTfNu5ew=;
 b=Fjyb8e/CAjy3tsH4M8Ol2erYzATzwaRENy4P7noq/x96FG5gekbTeKwZbTOjTmakmDjmliqL/uwhWEREvdXNnlQCPLjx0iGJaIYoUwCaIg+x0JpBozEhmoCAN0XF9qRusz27Q4/kKfAbtuSVGb5SBD+MGtnYEMWRQ0kgIqoRWh0=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by DM6PR04MB6874.namprd04.prod.outlook.com (2603:10b6:5:22a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.33; Mon, 12 Feb
 2024 08:00:32 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::649f:fe78:f90c:464c]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::649f:fe78:f90c:464c%7]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 08:00:32 +0000
To: Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <Naohiro.Aota@wdc.com>, 
 Johannes Thumshirn <jth@kernel.org>, Alasdair Kergon <agk@redhat.com>, Mike
 Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>, Chris Mason
 <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba
 <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu
 <chao@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni
 <kch@nvidia.com>
Thread-Topic: [PATCH v3 0/5] block: remove gfp_mask for blkdev_zone_mgmt()
Thread-Index: AQHaUoghqeGbsLL+DEOdZDv7LZr+o7EGbgiA
Date: Mon, 12 Feb 2024 08:00:32 +0000
Message-ID: <585d6aa1-4dc2-4c40-a865-82f7cd8ae8f4@wdc.com>
References: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
In-Reply-To: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB7416:EE_|DM6PR04MB6874:EE_
x-ms-office365-filtering-correlation-id: c9e63389-2a48-4279-1a8d-08dc2ba0afb3
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yu1F3Ex4nyqnVnOZ08wOh6t7/dmFo9Kz6De/DVF7FLGrTt4glL3sJg4mKT8OSEYCotIIo4DOO1RUd+9HsmULoUfiqXPMR2vhU68myITODs3y4ecREz+tbiOMqiFuhxIsBXVYZGKBogyLbaadn6g8Km6FE08qCVCHqE7nR4HH0OEKjoW0L7p0uY/nCzhzUQWcUW3anUwRr513LOvn0FvFARtCN4Ar18w3Kle8NFilD1tOStffP1NQ8zLiGZy8Lyy9FtJd+JpY5Qb9efKw4czQ2jLqwy6qEeDXCXACrPy8eyJCrszIty6o+kbe92FzBWNUjahCraG6KrfhBWs2TkaewNqo+GzsMFztkGRk+AgtrWjv3/F6AZ3LFMcp8911m2aHxJItscJ48H06XN/O+i2HZp+DmO/4Kjv1etsemKSCClmy7Q1SQeux5YnbHFQabevk4XDZu8CM0zJtwKwh7POXeFx1rH0WUmg0r18oWEdH9OlAU9UeMztWRwFTKLNiiB1TWfWFMI3PdKv49G5+MyP8XxQo1wL9J1g5dj7BImkS+30oUOkfnl9jYi/aEuvbthygiEYxvwub0N3ErO89L5JHD+TUzJHGUwcm6aSzy8hAqJz/RfxRT90z8szq9xG6KD0v
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(31686004)(26005)(71200400001)(2616005)(41300700001)(31696002)(66946007)(5660300002)(66446008)(76116006)(4326008)(7416002)(8936002)(66476007)(2906002)(66556008)(8676002)(64756008)(38070700009)(110136005)(83380400001)(316002)(54906003)(6512007)(6506007)(53546011)(478600001)(6486002)(966005)(82960400001)(86362001)(122000001)(921011)(38100700002)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWhVbGpCM0ZCNjVpTWF3TnJURXBOMk1jQnBvck5tT0NFTlZ6cmk1NmJUbXpz?=
 =?utf-8?B?bkx4VmY2RXBnY2ZRSUovK3c1aTZLdVRlN2pzdXorNDBuN255TlNHY1pnME4z?=
 =?utf-8?B?NjN6ZGFocVVLa2RpNFRIclQ3NERDUVpYbjgyNWttWTYyM0o4RkNjODVjbDFM?=
 =?utf-8?B?cEJQTHU3enoyaG5WcW56Wmd2SjV1ZHhvYXR5S3QrKy9naHRDempwR1lSQU5K?=
 =?utf-8?B?R3BMY2FzeXNrZkV1cnI5NEFtdkR5aGdBNldTVzVsZ2tEU1hjemhvWGVIMDRY?=
 =?utf-8?B?dEJxQk8xbGdac1dmVCtDWmZXOTFScWRwUE81UTg0QVQ0V1FGcmlVVmVQeVp5?=
 =?utf-8?B?MGFqSEU3alNXVUt3NFk0U1cwR3Y5RERQZnB1UzhYL2RVeCsvZ2ltYnFNT2Vl?=
 =?utf-8?B?QnJUZzFGUHUwSm5xU2k5cDgwdi9EZThPTG5Va0I3T3MzOVp4WkQycXZFL01p?=
 =?utf-8?B?Tjdadk1PUmtTbitORlRRdDh6VkhLbGJZZnF5NUpDS0gwa29URGxhME5DUTh1?=
 =?utf-8?B?clBXa09HejNCVy9TUThNdkcwVU1wQmhNbjJHeFVWQlhEb01zL2JJSFFvZE1x?=
 =?utf-8?B?YmRYWVdTNXN4Mlo4UndwZnJkNHlyODBFMlhpL1BVMUhxaGNON0xreVVMdFRY?=
 =?utf-8?B?S1dCL2sxdU16WWlheXcrRUF2WVlOa0ZUYm9WSVJOcDdOUVlzTWNOUzFOai9R?=
 =?utf-8?B?aVNqN2tFMDRQYVJSWXIyU1FlbUJVRG1nbm11cERBRmd3QkdCZnlmQU9MV2pJ?=
 =?utf-8?B?R0Y0NWVQRmtMV01iTEQ4R1RvOTBIZTY3VjBDUUNHVmY3eWF2eVZ2YmFXS1B2?=
 =?utf-8?B?THF3d3QxL2gzSGRUZ2tFTjlROFJaYytnUWFJSElIcGNsZHNNSU8xUlkzTitM?=
 =?utf-8?B?L1hqTS9OVHhyOWVWMEtORmxvSWhaTkxLTndPSGg2cDJJaC9vTUZtMUFYUEFJ?=
 =?utf-8?B?elBTa0RQcVBlK1J5eVVjVzlyS20rZ1ZZVXRTRzk3dkg1Q3dxSkszOVlXMGx0?=
 =?utf-8?B?Y0I3b3VEUUI4dmxBNEFxaXlNWXl6aGY2TnYyaVowQ2lBRCsxZlNLcjVSYytw?=
 =?utf-8?B?YmRUSldUMmNLOWFVSEszVCsxVGNnNG50Z0dXTUI2ZTRWQU5uMTFiUFo3Y2VC?=
 =?utf-8?B?SGZhUzJoNllKeFJlbzN5UG1hbzR5NlltYjg0MENuUmg3akRqejF6a1UwSmFR?=
 =?utf-8?B?TVgwME9GS2l1UnY2SVRSU2pESU5WNUVSR3JpZGZ0RVFvSUhWRndXMFc3TWU0?=
 =?utf-8?B?S1JOQzZVU2EyMkVDVERwdkt6SWZIYTVYcGlZK3JYWUJXZnZHQ2pnck01d3B6?=
 =?utf-8?B?V01pbGpHaE4zOVFEN0F6UXlaRzIyNldGc0tGRUd2REV4VlpMT3R1clpmc25i?=
 =?utf-8?B?ckZYWTZYaVN3RHN3QWh4M0FUT3EwUCtkY1Y2S3ZVMEk5UTZSbytOQU1uVTMv?=
 =?utf-8?B?dm82dFdneEYwL2NkRXUwVTNWeHhDaXkvLzRTcEI0Qm16dWFLeStjMHA2Vms0?=
 =?utf-8?B?aGp2VmxLb2MwTmtRbVA2U0hOR1JVak1UMHp1WWNRQXRUcXZoZExOVDlCQk5E?=
 =?utf-8?B?b01mckNXeDQyV3ZGUFpUbWZ4Q0JsZ0trejJvZ3dOb1ZvSkJpZkxRQzVwdGhR?=
 =?utf-8?B?SUZXRzhMQlNud0tmbGVqTkoyNWQ4L2tIZVA2MXVMaXF3SFJEaVdLTVA3QXZO?=
 =?utf-8?B?MUlMWjZtVWVWeG02YWJRLy9LTmdVQ0lmanZFWXNvWWZXdC9OaUlMMVM1N1p2?=
 =?utf-8?B?clRuNzYzdHdocVh2U3pRNDcrOGVFNlVSL2Z0V1ZXaFJvV3pmVHo2YUFhcFNH?=
 =?utf-8?B?d2dZT1o3elJSQjJhc2xsTW41UzF1WXVJUlNkZWNxYnlZclgweVdIQlgybzM5?=
 =?utf-8?B?cUdDazBvQXc5ZmpiNW04dE41MnluTms4MGJFVFdNWUF2enN1NTg2VXB6NFg1?=
 =?utf-8?B?STRzaDJPYXphb1JmbWo3QnhMMHNiQWVBWmpGS1dxTElIdlEzTkV4TGpWL0o0?=
 =?utf-8?B?dWlBUmFDcjFORWhveTM0RzRoZzYzb044S29iZTlmUmhjOFNuRGFQL251YzJK?=
 =?utf-8?B?R1RMcGJqTjgzMmExWG9zb21OYm5CSjNEc1lPV0grQ3JYUEFCNEpXM0I5b0pL?=
 =?utf-8?B?L3FIaTcxWlpwbkYzQ1p0QzIvek9HY0FvaWR0TkRFZWRvUEpkZHM1SG1udWc1?=
 =?utf-8?B?T0E9PQ==?=
Content-ID: <A9779686715CF74E9E5B9412961EE246@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: KPLRnsyESXP3g06rh7d/qYpQGudX4ajZx68neAe+f/DVKhPdxMQUOeQK7qLC5Rr3ynNbMUH28xq06loItY1g69+8wF07JephXdlvY0qRPPXM/NE0ZIRJMj71uiKJgFBcht0BZMfZk/Szw4tUgctDlfNu4XWNig/+X1f82oIjVsjGpjT0HjpKEfTNXXR5eSr3gDqYd02wN9eQamHKFG6Hzv9bFo6ij+AQ+DcLGgxNCMgjDo01u0j6s8sah42yz6Nc0nFdwRCiJAiglv3t+ebIyKafleZQpENyfXmTC53LRsvdHThfsLb9ckjnZWkSlVrunkX1Qme6xfqwmB5CIEaugqOyjTeIvyCj9fNfbjL+65qpAPKIxvIte3WSN8WwlyqvDzY0RySUpY0MIbksm+N7C1QGPdytTnAWD0Hsslphg3OE3Dj/kimxbh2STY01fcacIobrjLBLScQt3xPf5P5OGLMHpmo0wkVTawNmvMJYKtx3wank7UtHp+TMEpGVcgG9nyQ0qljQOvX218oTOiPqiwmezA/OWUkLcC/s0z14EfM/L/YrMDaY/Ib9Pi+fLP0gdj424kz0NJI6paTbz9U2KilJpycE99xUriW1zbct0YM+beyq4j1xsWavr5IkfMLq
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e63389-2a48-4279-1a8d-08dc2ba0afb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 08:00:32.1829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZzWYk3nl7jtJpikmi/J/y4zhQjtbaSpUTieujyA5CqGCIcaPQo/oH4G9cgyhMr3YpxDi9dSanmXsocilJlTG2mPyHFschRp6bFZczYS/8zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6874
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 29.01.24 08:52, Johannes Thumshirn wrote: > Fueled by the
 LSFMM discussion on removing GFP_NOFS initiated by Willy, > I've looked into
 the sole GFP_NOFS allocation in zonefs. As it turned out, > it [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.144 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rZRF8-0008DP-F9
Subject: Re: [f2fs-dev] [PATCH v3 0/5] block: remove gfp_mask for
 blkdev_zone_mgmt()
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
From: Johannes Thumshirn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 29.01.24 08:52, Johannes Thumshirn wrote:
> Fueled by the LSFMM discussion on removing GFP_NOFS initiated by Willy,
> I've looked into the sole GFP_NOFS allocation in zonefs. As it turned out,
> it is only done for zone management commands and can be removed.
> 
> After digging into more callers of blkdev_zone_mgmt() I came to the
> conclusion that the gfp_mask parameter can be removed alltogether.
> 
> So this series switches all callers of blkdev_zone_mgmt() to either use
> GFP_KERNEL where possible or grab a memalloc_no{fs,io} context.
> 
> The final patch in this series is getting rid of the gfp_mask parameter.
> 
> Link: https://lore.kernel.org/all/ZZcgXI46AinlcBDP@casper.infradead.org/
> 
> ---
> Changes in v3:
> - Fix build error after rebase in dm-zoned-metadata.c
> - Link to v2: https://lore.kernel.org/r/20240125-zonefs_nofs-v2-0-2d975c8c1690@wdc.com
> 
> Changes in v2:
> - guard blkdev_zone_mgmt in dm-zoned-metadata.c with memalloc_noio context
> - Link to v1: https://lore.kernel.org/r/20240123-zonefs_nofs-v1-0-cc0b0308ef25@wdc.com
> 
> ---
> Johannes Thumshirn (5):
>        zonefs: pass GFP_KERNEL to blkdev_zone_mgmt() call
>        dm: dm-zoned: guard blkdev_zone_mgmt with noio scope
>        btrfs: zoned: call blkdev_zone_mgmt in nofs scope
>        f2fs: guard blkdev_zone_mgmt with nofs scope
>        block: remove gfp_flags from blkdev_zone_mgmt
> 
>   block/blk-zoned.c              | 19 ++++++++-----------
>   drivers/md/dm-zoned-metadata.c |  5 ++++-
>   drivers/nvme/target/zns.c      |  5 ++---
>   fs/btrfs/zoned.c               | 35 +++++++++++++++++++++++++----------
>   fs/f2fs/segment.c              | 15 ++++++++++++---
>   fs/zonefs/super.c              |  2 +-
>   include/linux/blkdev.h         |  2 +-
>   7 files changed, 53 insertions(+), 30 deletions(-)
> ---
> base-commit: 615d300648869c774bd1fe54b4627bb0c20faed4
> change-id: 20240110-zonefs_nofs-dd1e22b2e046
> 
> Best regards,

Hi Jens,

now that every patch is reviewed, can you queue this series please?

Thanks,
Johannes

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
