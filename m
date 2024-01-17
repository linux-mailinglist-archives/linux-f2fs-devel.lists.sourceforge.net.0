Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4A58303B2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jan 2024 11:34:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rQ3FF-00071S-Ds;
	Wed, 17 Jan 2024 10:34:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng1@oppo.com>) id 1rQ3FC-00071B-Up
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jan 2024 10:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zvxpNaIlJMqTpsQkuuh3sXRCvDqQTBotcXWI752ns1U=; b=Y3VHnEAOe6WcF9wq2jcBGHbRd0
 3ics8N8q1Es7R0ib+jxuwqi8OoRPfnXFDJ1PHME+9o2Z0ffZDb3qLvz21NxHK2HOKlP8TiOuzAM3g
 e73h1jHQ+vRpgAXPooFE7hGoIOfeHvJAUK90PxhZa75wTxgvPtYgrm1g4K4oRm5XdVgs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zvxpNaIlJMqTpsQkuuh3sXRCvDqQTBotcXWI752ns1U=; b=M6F2sgpxesvrT2OOeOy6XLdNov
 O5Y5ELuP4fV0gthQAh4dNntaZkUjw872IAuVtWhKXRrSD8YSxECL1dQTGNq9PtIzUJor9BXCsseQ/
 0gzlSzz2xdnxtsIMTpun3u+9e1V6iXRkku4I7UHggSlMaeSBaJqYcjan/o4xTO1sabp0=;
Received: from mail-eastasiaazon11012009.outbound.protection.outlook.com
 ([52.101.128.9] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rQ3F6-0002Hq-Vn for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jan 2024 10:34:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMzLFfFSwWZYt7Qw0+YaALN9v5sGPupUOpQCAZpFVjQjGEldmSyl6rrc8/PpyY5ltbbGeefrI3i2wDBSuDW1yfEdw+jE8GbbRIt80y+L1hqSaq7j9m5gkL8p1HdtrPaLKPyp2SvbQGojd2XtjCsV5VkGbT7muUm691bRswal/HqhH4yF46zoBdX4FGXqrnftwAbH+aOmNH96pfbnQT+juj5v/iTQGecLtGuWfzTpaErjQcSi5Ty3VOL651X5K7V3rdxNbcO+MAMqJTJZLUFHTz3QM2BXt28B+Gk1KJc3FtyUYpaRDitTBPC+fI7KBxk/eLga3oWuJGqavgt9dO6Tdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvxpNaIlJMqTpsQkuuh3sXRCvDqQTBotcXWI752ns1U=;
 b=grNdb+fDMuckydkuqXqgx3erskigQfU47+CDAU7hHT9qIbwOfx8xXP2/nqKr/UiiDaBg4gRyFXcL2GhWl+nK08jaGQfXQ2F476t1Eeo2gfoJzNCra2my2DvhjgNX1QgV3ges4/7clcNwLvi5nu1rxJKnaqtettGDzIGCTNyrO1QlYC+CvFPIBPwqU6jcA8xfWkJHjBEFhvH9XnxNpCTRQyCNKM36FC2bOx7w1aaYjdQqbUQEkxmgfSRzhFHuv/QPxncvZPnwHWaM5YZL9YrZInwxkji9u0NBuvnCpECnH+zdncNY+6lSmxKPYnfA5BtjGf03uooKNRoVJ5JfPG9EfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvxpNaIlJMqTpsQkuuh3sXRCvDqQTBotcXWI752ns1U=;
 b=u06Z6ETnsiuujjTBIDoEzJW69VYIU2PzM6mSdpQmc9T+MAETXBEWr3NBLTXOg3dRaJQe3YFWjBscJFA+KI5WB8jsDu/UaGkvyh/ftVO009wP5O9Js8JQBDyJZU07jf28XS/1yQEykW0W1CEwOfSvQ747tXNhlTClm4UjOStWdcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com (2603:1096:301:90::7)
 by SEZPR02MB6955.apcprd02.prod.outlook.com (2603:1096:101:18f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 10:17:50 +0000
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::f4:dbf7:9c0c:5388]) by PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::f4:dbf7:9c0c:5388%4]) with mapi id 15.20.7181.027; Wed, 17 Jan 2024
 10:17:50 +0000
Message-ID: <601da6d0-8e22-4e6f-a791-5db9d5ebc793@oppo.com>
Date: Wed, 17 Jan 2024 18:17:48 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wenjie Qi <qwjhust@gmail.com>
References: <20240116141138.1245-1-qwjhust@gmail.com>
 <CACOAw_yL7fLmjLkK29yEb3hgTqoDO2hntOX5LMHmWjZWWix1ig@mail.gmail.com>
 <CAGFpFsSSg+Xs9TAw8qOadUxj8kYfyc+h3cCu_UJsxXUzMu50vQ@mail.gmail.com>
In-Reply-To: <CAGFpFsSSg+Xs9TAw8qOadUxj8kYfyc+h3cCu_UJsxXUzMu50vQ@mail.gmail.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To PSAPR02MB4727.apcprd02.prod.outlook.com
 (2603:1096:301:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4727:EE_|SEZPR02MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad543d6-36a9-41ba-bfcd-08dc17458f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDShqMc2uogl9BSeN8OGKwbFjNjVGeGi2lpJ+pOzYaHZM9Zh3muNVOxCnu9YlQpfkN88asIF+COtolH6l56Mz6H/AwbYU0HPxZcYkCQZF4Dd3Bh+8zrQAhSR5Q5pi57jJ0WsisMdXrlZ61mdf9Wc2pwSv49t3pR6jBmD4POAJZLPzOzweLbgzIGN9hZ7ZanPloTzOo1hgdoQSdlFtSvpRPPc0kcJmZ79gzgh8t1y95ivARPx+MxmVLQGPP8vrJ1uex5o2V2J3ukBRJ+7zv85D0+x4AJ1VyrtN8s5VosXEIV1MRw9MUw8GajZt7rQZaibTo/6qj7qU2ZXLHDkYy88otGH9o+eWcTXR0QKTsFnYRcYze7V9J/ks5STjMrR+vfaCXai9cGVTo95c5Cqva3stjWKXJjaw8sylP91t60oK+iHQWm6YARHO6Yqf39wWaKEi3FH8CRggnmaraC9tjUqRDynoiqq4K+COf2McmXXYUMrtFe3yFAkJKKI4dHhLNErmIe1u39w557ETRp55mJ5yJ5B1pjauGVp0b9Yg8uJ+wv9CShw3chiG6J7YFtcb9HH4V4Wt10cJvnxgxOF2W6DLFd1u9RjEv7Ec7PeEb9nuEi46bfgxj5n7N/MNRyjt7oZl+YcVX6rXz6wJoLyb2qPxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR02MB4727.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(2616005)(26005)(83380400001)(86362001)(31696002)(36756003)(41300700001)(66476007)(5660300002)(66946007)(8676002)(66556008)(4326008)(6506007)(6512007)(8936002)(38100700002)(6916009)(316002)(6486002)(2906002)(966005)(53546011)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEZqTXRHRTFrUFNWMWIvMnpOcXdzeU1RYkMyZGE5b1JUanMvaVI3ZDZIMWda?=
 =?utf-8?B?Ym5ua0c0cGlhNnpqZDQ0TFl1RDN1WGxaamVLVEVPbnRHTExCd2xFenBuMlc5?=
 =?utf-8?B?c3RlOTJRVERFb2VLZ2FQN0dFOG44dTNraDh0cWxlQlhSYmJUb1FVU1lmWlV6?=
 =?utf-8?B?WWZTRUtiNGNxVTM4QldBRDl4SkZDd3Vob2RpdjhSbEJkQXJycTNNclpIRXh2?=
 =?utf-8?B?dlg5MjhtMFUrUHhCVC9CaGdwNWV4NTFoblIwWWpFOGtNRHNuSjRXbVMyZ1VS?=
 =?utf-8?B?MURYTmJFeGlUbGRWbE54NXdlOUdaSm9kQzN1dGN5eXhCbmVWdEl0OVVNbFA1?=
 =?utf-8?B?RzFDMGdYb3JpZ0V1UUpjcldVeStiZllBWGhhdnZRQnVXUExJSlJpWlZiZm1K?=
 =?utf-8?B?czZYU1c5SGFwbjFaYW0vb0gwM0N6cUJpRTdxQVJXL1Y2MXVlRFRnUFAyN0JD?=
 =?utf-8?B?Y3RJT3pYT2xvTkxaOXh2emt3N213OHhXWGNvV2E4cy8rU2kvMEI0OGlGNjAw?=
 =?utf-8?B?WnlhSk1oWTkxSDhocDBQaSsyRzRTMWg4STZkeVc2SHhqcGhES1pzcFU2akhH?=
 =?utf-8?B?Y1BxV2Y2V0Rwai9HZmdyOXlKSktoWGJoNjZXZHhMcWZzRXlsRis1RVRFSjcy?=
 =?utf-8?B?WnAvOFRXclQwb2VhUTdpMGltZWQ4Wm9keGJ3eFVoNGozQUFrWEtSZUpJMC94?=
 =?utf-8?B?cW5tVklZK0RSRUk3UE9DL3NjZmZING1TZ29qakx1OXlNcGY1eklISC95aG80?=
 =?utf-8?B?Rjk2SEY5bExZYk4vM2pBMHVtd2dwQzFjRmR1L1B3UkpwMmJyTVpXdUFUSHR0?=
 =?utf-8?B?N29VUXE4d0Z1cUttemoycFNKVmhDcXhBUjZQak9oRmNlZkd6cmJ2VkJKOUsx?=
 =?utf-8?B?UEVZMzQrMW5tblZWOW5PZTlNSHZBMGFXQStxOC9Kc3k4ekk4bnBkUGp2TXl2?=
 =?utf-8?B?UzlMakhNUlRHUVFHNW8wY2JWNUMrVGs3QVlxZW40RzhiMHEwTHdSSzY0TUE5?=
 =?utf-8?B?eVhBdFE5TG5MQ1BERlFIMS9zeUIyUllZZng0Y29PSmU0Ymc5eENFeW1HTzVT?=
 =?utf-8?B?cGVpbGprbVFNTUNPMk1jVHkzbjY5dUoyTS93SVcySzgrUWpzcms1VEd4MnRx?=
 =?utf-8?B?OElzdFV1TUpGOXpqeWk0QTMrRmNKSWI0UTZBS3pYN1dSaGxldFlnZ3kvWGZI?=
 =?utf-8?B?bmd4L2hpS1ZEckYyWUh0UjZyaUozakk2ZzhpOXNYcGZINCtHNm9CdmpuSjRu?=
 =?utf-8?B?NmlZRWxrc2h4dS9zWWZsOFc1ZXd3c0VyZFZaMW4vdlNvM2JYQms0NjZGbG9G?=
 =?utf-8?B?UGRnUmF2SHJDc1lOMHRROHVRYWN4S0syaW1HeUp4eWxhN1kvNnB1ellCRFN5?=
 =?utf-8?B?akFpamI5azk2Q0d1T04yQncwMytPQTVmWkJMMSsxU3paK1R5Ni9qSy9vUWhJ?=
 =?utf-8?B?RGJuOEpYTW9GWXY2cTZWSWFTMHpNWDhnenEvaUtnSUdxOW5MVEdPYnBxa3Zw?=
 =?utf-8?B?eVFZdWlzdVVkdkhHNmwrN2pZK0hYTWc4UUMyNldMQmt4VG9XQlJraldCTUZy?=
 =?utf-8?B?c2FnanlFTXI4cmE5NnZrZFhvQUxOV0hRQnpsVkVEQkh2ZUs3MU9ISnU1SU9Z?=
 =?utf-8?B?c3pmOWxpOU5VcmF2azR5OUgyNjA5Q0drUGhFR1h1SlN0RndVWGZIdE9uRmVH?=
 =?utf-8?B?d2hoQXFFbmNDd21BSzRVNlJYMmFCcmxCL0Y4aGkvRHBxS0E3RzZrUVpRdlEx?=
 =?utf-8?B?aTNHT2ZDUjY5aTBpd2NUbkV6Y01VdlNORUdrbHgwb2NuMzZhTGh5SjkxSnJC?=
 =?utf-8?B?blhIQThua0IzaktKL3VMM3JKcUFGWGY5TXU4RDNXbERiUHdzeWNyeEhQSUMx?=
 =?utf-8?B?K3d4Rlc2SUEwbk5sdGpkUENEN0MzOTBWbmhXeG9hWEdyZzlMK0ZNaklhZStq?=
 =?utf-8?B?Z25QZTFXOC9JRDM1REdESmZWUE1neXpaUlRHU3JhcjlxdmtRTG1mbjdKekYy?=
 =?utf-8?B?b3NjT2RxZEtLWFBHV0tCNDZpVVFqTi96Yjd6MDZQYWFEeDZhQ2o1dFpxQVRU?=
 =?utf-8?B?am5kNUk0V3Y2UWRQTjdHNy9tOFhLRkRGVDh0UHV0dXNrQmdMMjVpaSt1Skwv?=
 =?utf-8?B?OTVsS3VWbk8zeWtCcXlmc1lsZE04a1dJR2VNVTMxdndJbk9nT2NWNXJQRGI5?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad543d6-36a9-41ba-bfcd-08dc17458f36
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4727.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 10:17:50.4488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfFf0ZPS196+so4YuqKS/fPA6H2PsQ3mO5bZNX4YeNw1jHVkNX4jEf75p1P3XrysuoZ8TsoQnf7X1sHYxa53oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB6955
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello Wenjie, This patch does not prevent the simultaneous
 truth of list_empty(&io->io_list), fio->in_list, and is_end_zone_blkaddr(sbi, 
 fio->new_blkaddr). NULL pointer dereference error still exists [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.9 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rQ3F6-0002Hq-Vn
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix NULL pointer dereference in
 f2fs_submit_page_write()
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
From: Yongpeng Yang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yongpeng Yang <yangyongpeng1@oppo.com>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8gV2VuamllLApUaGlzIHBhdGNoIGRvZXMgbm90IHByZXZlbnQgdGhlIHNpbXVsdGFuZW91
cyB0cnV0aCBvZiAKbGlzdF9lbXB0eSgmaW8tPmlvX2xpc3QpLCBmaW8tPmluX2xpc3QsIGFuZCBp
c19lbmRfem9uZV9ibGthZGRyKHNiaSwgCmZpby0+bmV3X2Jsa2FkZHIpLiBOVUxMIHBvaW50ZXIg
ZGVyZWZlcmVuY2UgZXJyb3Igc3RpbGwgZXhpc3RzIGluIArigJxiaW9fZ2V0KGlvLT5iaW8p4oCd
LiBJcyB0aGF0IGNvcnJlY3Q/CgpPbiAxLzE3LzIwMjQgOTozOSBBTSwgV2VuamllIFFpIHdyb3Rl
Ogo+IEhlbGxvIERhZWhvLAo+IEkgZG9uJ3QgdGhpbmsgbW92aW5nIGp1c3QgdGhlICJvdXQiIGxh
YmVsIHdpbGwgd29yay4KPiBJZiBhIGZpbyBpcyB6b25lIGVuZCBhbmQgaW5fbGlzdCA9IDEsIHRo
YXQgZmlvIGlzIG1pc3NlZCB3aXRob3V0IGJlaW5nIGp1ZGdlZC4KPiAKPiBPbiBXZWQsIEphbiAx
NywgMjAyNCBhdCA1OjU44oCvQU0gRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21haWwuY29tPiB3cm90
ZToKPj4KPj4gT24gVHVlLCBKYW4gMTYsIDIwMjQgYXQgNjoxM+KAr0FNIFdlbmppZSBRaSA8cXdq
aHVzdEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4KPj4+IEJVRzoga2VybmVsIE5VTEwgcG9pbnRlciBk
ZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAwMDAwMDAxNAo+Pj4gUklQOiAwMDEwOmYyZnNf
c3VibWl0X3BhZ2Vfd3JpdGUrMHg2Y2YvMHg3ODAgW2YyZnNdCj4+PiBDYWxsIFRyYWNlOgo+Pj4g
PFRBU0s+Cj4+PiA/IHNob3dfcmVncysweDZlLzB4ODAKPj4+ID8gX19kaWUrMHgyOS8weDcwCj4+
PiA/IHBhZ2VfZmF1bHRfb29wcysweDE1NC8weDRhMAo+Pj4gPyBwcmJfcmVhZF92YWxpZCsweDIw
LzB4MzAKPj4+ID8gX19pcnFfd29ya19xdWV1ZV9sb2NhbCsweDM5LzB4ZDAKPj4+ID8gaXJxX3dv
cmtfcXVldWUrMHgzNi8weDcwCj4+PiA/IGRvX3VzZXJfYWRkcl9mYXVsdCsweDMxNC8weDZjMAo+
Pj4gPyBleGNfcGFnZV9mYXVsdCsweDdkLzB4MTkwCj4+PiA/IGFzbV9leGNfcGFnZV9mYXVsdCsw
eDJiLzB4MzAKPj4+ID8gZjJmc19zdWJtaXRfcGFnZV93cml0ZSsweDZjZi8weDc4MCBbZjJmc10K
Pj4+ID8gZjJmc19zdWJtaXRfcGFnZV93cml0ZSsweDczNi8weDc4MCBbZjJmc10KPj4+IGRvX3dy
aXRlX3BhZ2UrMHg1MC8weDE3MCBbZjJmc10KPj4+IGYyZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YSsw
eDYxLzB4YjAgW2YyZnNdCj4+PiBmMmZzX2RvX3dyaXRlX2RhdGFfcGFnZSsweDNmOC8weDY2MCBb
ZjJmc10KPj4+IGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSsweDViYi8weDdhMCBbZjJmc10K
Pj4+IGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMrMHgzZGEvMHhiZTAgW2YyZnNdCj4+PiAuLi4KPj4+
IEl0IGlzIHBvc3NpYmxlIHRoYXQgb3RoZXIgdGhyZWFkcyBoYXZlIGFkZGVkIHRoaXMgZmlvIHRv
IGlvLT5iaW8KPj4+IGFuZCBzdWJtaXR0ZWQgdGhlIGlvLT5iaW8gYmVmb3JlIGVudGVyaW5nIGYy
ZnNfc3VibWl0X3BhZ2Vfd3JpdGUoKS4KPj4+IEF0IHRoaXMgcG9pbnQgaW8tPmJpbyA9IE5VTEwu
Cj4+PiBJZiBpc19lbmRfem9uZV9ibGthZGRyKHNiaSwgZmlvLT5uZXdfYmxrYWRkcikgb2YgdGhp
cyBmaW8gaXMgdHJ1ZSwKPj4+IHRoZW4gYW4gTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGVycm9y
IG9jY3VycyBhdCBiaW9fZ2V0KGlvLT5iaW8pLgo+Pj4gVGhlIG9yaWdpbmFsIGNvZGUgZm9yIGRl
dGVybWluaW5nIHpvbmUgZW5kIHdhcyBhZnRlciAib3V0OiIsCj4+PiB3aGljaCB3b3VsZCBoYXZl
IG1pc3NlZCBzb21lIGZpbyB3aG8gaXMgem9uZSBlbmQuIEkndmUgbW92ZWQKPj4+ICAgdGhpcyBj
b2RlIGJlZm9yZSAic2tpcDoiIHRvIG1ha2Ugc3VyZSBpdCdzIGRvbmUgZm9yIGVhY2ggZmlvLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFdlbmppZSBRaSA8cXdqaHVzdEBnbWFpbC5jb20+Cj4+PiAt
LS0KPj4+ICAgZnMvZjJmcy9kYXRhLmMgfCA4ICsrKystLS0tCj4+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+IGluZGV4IGRjZThkZWZkZjRjNy4uNGY0
NDU5MDZkYjhiIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+ICsrKyBiL2ZzL2Yy
ZnMvZGF0YS5jCj4+PiBAQCAtMTA4MCwxMCArMTA4MCw2IEBAIHZvaWQgZjJmc19zdWJtaXRfcGFn
ZV93cml0ZShzdHJ1Y3QgZjJmc19pb19pbmZvICpmaW8pCj4+PiAgICAgICAgICBpby0+bGFzdF9i
bG9ja19pbl9iaW8gPSBmaW8tPm5ld19ibGthZGRyOwo+Pj4KPj4+ICAgICAgICAgIHRyYWNlX2Yy
ZnNfc3VibWl0X3BhZ2Vfd3JpdGUoZmlvLT5wYWdlLCBmaW8pOwo+Pj4gLXNraXA6Cj4+PiAtICAg
ICAgIGlmIChmaW8tPmluX2xpc3QpCj4+PiAtICAgICAgICAgICAgICAgZ290byBuZXh0Owo+Pj4g
LW91dDoKPj4+ICAgI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4+PiAgICAgICAgICBpZiAo
ZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSAmJiBidHlwZSA8IE1FVEEgJiYKPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBpc19lbmRfem9uZV9ibGthZGRyKHNiaSwgZmlvLT5uZXdfYmxrYWRk
cikpIHsKPj4+IEBAIC0xMDk2LDYgKzEwOTIsMTAgQEAgdm9pZCBmMmZzX3N1Ym1pdF9wYWdlX3dy
aXRlKHN0cnVjdCBmMmZzX2lvX2luZm8gKmZpbykKPj4+ICAgICAgICAgICAgICAgICAgX19zdWJt
aXRfbWVyZ2VkX2Jpbyhpbyk7Cj4+PiAgICAgICAgICB9Cj4+PiAgICNlbmRpZgo+Pj4gK3NraXA6
Cj4+PiArICAgICAgIGlmIChmaW8tPmluX2xpc3QpCj4+PiArICAgICAgICAgICAgICAgZ290byBu
ZXh0Owo+Pj4gK291dDoKPj4KPj4gSG93IGFib3V0IG1vdmluZyBvbmx5IHRoZSAib3V0IiBsYWJl
bCBpbnN0ZWFkIG9mIHRoZSB3aG9sZSBibG9jayBmcm9tCj4+ICJza2lwIiB0byAib3V0Ij8KPj4K
Pj4+ICAgICAgICAgIGlmIChpc19zYmlfZmxhZ19zZXQoc2JpLCBTQklfSVNfU0hVVERPV04pIHx8
Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhZjJmc19pc19jaGVja3BvaW50
X3JlYWR5KHNiaSkpCj4+PiAgICAgICAgICAgICAgICAgIF9fc3VibWl0X21lcmdlZF9iaW8oaW8p
Owo+Pj4gLS0KPj4+IDIuMzQuMQo+Pj4KPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4gaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+
IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
