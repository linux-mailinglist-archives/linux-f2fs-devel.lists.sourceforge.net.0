Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E2776EC89
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Aug 2023 16:32:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRZNP-0002v2-2M;
	Thu, 03 Aug 2023 14:32:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qRZNN-0002uu-Ea
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 14:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nWUuQXhrrn3E1y72S2cyAqffsPWSK3qUr6h1sb2YlU4=; b=HjVcjpVGeyruICjFq4gMVz9eDy
 ko6AcXS18GWFu7SslY8kNkFnBXkjYzy1XnI96QZbiFsagEyEX3vgOsinXYJRDSnUWYuqhEbdeOLYl
 zHoigDttjgGwtOiixdeojwJLPizEi/GXD7Tg7XRN3G4aBNcZKmq5zZq8MImsm0oTtL38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nWUuQXhrrn3E1y72S2cyAqffsPWSK3qUr6h1sb2YlU4=; b=KwRBo+PLzByXf0BpUNo3p4vgqW
 0jx2IelT6XeFViqwvihgB1Etm053dulfROP6HU/ylrTMzHarD6RrnH1EJUb7bI60+zIlJoKpEBNeB
 lMHessOX/BgT8oAQtLGtm65NfzSGBVO1McrBIakkaJL4LCU90eLyPF4NUYO6dAvM0M+k=;
Received: from mail-tyzapc01on2136.outbound.protection.outlook.com
 ([40.107.117.136] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRZNJ-00C2NX-V5 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 14:32:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQUgMv7AW8khhmxkcQ5Ahl7XxsHXjWDSKXxGb9iw75VEJMX0MXS9R96+eoLBgoC8ymv/iCPAsEhG56b9FnFnczR16ebk7YT+dcux12apP8iSUwFi/LsbNdECf2/1R8CnZa4p0gjBEetLfCG3pQDAIjpPQgbtMjIU2C9hfggwVxMNKSxzNw32/jQzN2I9VlYLIoi9Zqca2XMAjbbVAsLiCQLrjjG6DNOo2+gWOI02a8a7k+oHRTkPVcejLS/AAg8rHTjnWgaKefWuXnvt6+hAyv54+P0iiKleJ5/xVxjjc2rLB+nmdUZx0zaOKBG0wjfPsZQvGyX+f1iD7+GDCPOPyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWUuQXhrrn3E1y72S2cyAqffsPWSK3qUr6h1sb2YlU4=;
 b=cwd/8ydKOhcGsvJt7IiJv1Sgr9hQMZSh6kdd+ZH+7wzureNVGgzrsPOh7t+Y1T+yDmC3CtJF08psdRLKt8EnM990ZCMyRNv55RXHqcZZXjDOspxk2GHycLxx/4sAK+c1SZir1RJEnY0K8RaQDKWTF8IokJlNXrXlVtpSedpB1dxcVxO27wmC64HgqgJdrA7EHohCeNJejKPfYuKx0ibvIpE/uHnfDkxuQQcNnnSgDMR/981SMVYH3YOnrKfgCGmfwQSd3m8sSu8rHyl+ZbeUXfTVoymeVX12GJaRrKtJxhPyk77sSqX+LxXzIMKkgR4Gzb/g0nYy3DT0eiCaI628nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWUuQXhrrn3E1y72S2cyAqffsPWSK3qUr6h1sb2YlU4=;
 b=Nob4LcaFC+1ltuPwBg43kJ4FKu6a4caw8kUk0yFUyOyv9mYRcWY5kAh5Oj4Mp1ZofZ6bUKkvUuA8jfzgHvTRpjusppgawNDRH+wALZ/EQpKFgJ00Rj1VlXNuD97CfbbQTknIXnKHbGdJyTOfZ1HBA4DgjG6UH7gNl10Py2wAP8xTaZerxYfk2lp1c49gItbeIl/3HPDTwj44x+oLfD+mwjv4dQ0kW+Zclfxs2YiXEwdPBmYym2oBU+l2twtgcyUKAC1aPUjW/oXkkvceG5Za3ZXjhD0+ANwU1YQBBzZRtRbCvXWH36hDbQLq2WpyGp0km5Rr3QL0eAOi9/q++930EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by TYUPR06MB6026.apcprd06.prod.outlook.com (2603:1096:400:350::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 14:32:17 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::9df2:1896:b020:b51a]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::9df2:1896:b020:b51a%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 14:32:17 +0000
Message-ID: <77c8ee39-4dbd-8397-65a6-c41c0aeea860@vivo.com>
Date: Thu, 3 Aug 2023 22:32:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20230620141035.69782-1-guochunhai@vivo.com>
 <3fbf56fd-5b4c-0f80-5758-5addfffe83a6@kernel.org>
In-Reply-To: <3fbf56fd-5b4c-0f80-5758-5addfffe83a6@kernel.org>
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|TYUPR06MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ce7d97-b51e-412b-ebd7-08db942e6fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xRpZntx/tL5NHJiAm86xs2LKk36NKh5cz1bKYOpJy4kjoO8sVLHCZojtmRFqAuyAsu5jQsQfL/qKgE0l0GzAKEXnUhfB/eb3UZoTaXXVprjzPRWGHdk9t8YRiXUcUTpE793ZZCPtsUU0OdrI7y8is9+69HN0qs9plLU3bBgGs3O+bO3QwfdPBm++Mlhvcoo31EDlpz9781cmCHNC/0O4wYg7k0e2xaDtqKgZL59yiadmVg86X2wzBkgJpfrscAWDW52wjTf9OWcBF2JdK6mapd23id77Tnq+2IieJ6m4Ek3mfWRXgiaWHKV3Kv6z938Zum9S8m8fBjAMBlL1j9Rv8pFV64WxT8o3un13xKb3OW7d0c3AuqieLR5rjMD2Qo8g+NaYLWOzH70sUVWX2p0FhxRvfoUqDeJeK//Hglb1C1Tkmvgdgkddgv9NcgszxQQjtwJqtVhrohm1axYt46PW0kft7y6wRj5Bm9cmMCwMVf5067H236ooNq5zZL0jaP+2kebnu+H0KB8p6iTh97s3aObg+t/BAJSFFJNo42rKXobPjCj6JbBaXfEnvsGDXy6BP0rI1s0RGfIuMiE43WQgVL1XqdFSC0/x6v2aIuHB66+XyJbyO6iW9OQ9C2pi0UbburNmDYdOVRgT7/7lk9p5iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199021)(2906002)(31686004)(66946007)(66556008)(66476007)(5660300002)(8676002)(83380400001)(41300700001)(8936002)(316002)(4326008)(36756003)(478600001)(110136005)(6666004)(6486002)(6512007)(86362001)(2616005)(31696002)(38100700002)(53546011)(6506007)(186003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmtuTUNhV1QzZUorRmluY3c2dG1oSEVtay9oSlorRXhKajhaanlkUkQvRmFi?=
 =?utf-8?B?NVZTbHdSY3B4N21UZW5xVGVVVnllUnpockFMalJTQzdjdHRRL2FhNVhpLzVC?=
 =?utf-8?B?eEhZeHFNK095aXZuZXJRVGNwTjVBWVdJRVJwQlZkMTFodkkxK0xFNzJjQjFo?=
 =?utf-8?B?SVVUR3BmR2pOenRja01QNlQ4eTYxbUhMRzhneTkzWllYT09yLzlTZmF0NnFy?=
 =?utf-8?B?WlNxbVdxRytlK1E0N1NNdHExSGZjZllTbXBadE8xSlJzSTRLNlV1Yis0QUUw?=
 =?utf-8?B?M3dBNXhwTjZyRVgySVRZMVd4NC9TZGp0YzgxT2poMXR2bjRXb3REdVppQlBt?=
 =?utf-8?B?eG4yamtrWXpSWUExYnZab2JVMmpQVDlxQjZDbURBM2YzNllsazJDQnR2S1k4?=
 =?utf-8?B?MGFXSGNvSnZLRmMvSHQ5VHB1ZnVBdko2WlFET3cvNjJPNXN5NEQvRG5FRE8w?=
 =?utf-8?B?YU5nZXBDVU1sb042Wkt4Q3RkdXcwdUdUMklUbU9CendKSk5UVk4wNWk5OWdl?=
 =?utf-8?B?TFRtQU5tTzhsS21MS0pRWEE1eDhOQUNybDBLUk9TdDR2WXFrbE91K1VYeHlU?=
 =?utf-8?B?VXVvemhET090NVMreGtIOWt5OUtINHlCQ1RoZm5BdUxkeS9lakxNVWR6eXVZ?=
 =?utf-8?B?YU92MlE5OUZVWGsyaXVZRFo3WFZXNllCRzlRcTU4clZWU1JQUkpqNEY5SzdL?=
 =?utf-8?B?YTQ1bnQ2ZWdTNVZ5QUVIUklvRG9jckVKUWJNcm5zZXdCOWxzUGx3Uzc3QzdU?=
 =?utf-8?B?cVdOS0ZhM1pIUDFiSFRDdGFwUDN2L0I2QWJsVVFVYzJVVFNITVFOQUlMOGkw?=
 =?utf-8?B?akx5TVF5eDhGdEppbHNDcitnL0YzRlJwTU5NVkZtY2p5SS9BL3NQTWlkbVU3?=
 =?utf-8?B?WU5RRVNhSTJOVGp4aWVsTTVvWTc5MGtsZ1FqSTc3OFozQzdzTmtxUlA1VVNE?=
 =?utf-8?B?MkVvbm1Sb05wVlFWNTVTdll4ekdhdndZV0xodVJFRUJlbTc0N1c1Tzg2NzVY?=
 =?utf-8?B?L3Z4UmVoNXNvUE5tS1ZhSjg0OEt1anpoYTkyWk9LM2ZEKzAvNkNTUTBJQTJi?=
 =?utf-8?B?T2JKL3dLRUlPZ3QvNUV1eGQzdFR0KzQxMkhNeVpsVjN3aGpkcmVpQW04d2h4?=
 =?utf-8?B?aCtWNFlCL1Z0U0RLQkRmSFRralhDa2Z1RURpZ1pYTTZLcXdveHU1dmloODhQ?=
 =?utf-8?B?U2g5dlZoZFFNNHVxdEMvenAzOUNNWkllZ3k0NWp0OTg0YllrRXZpQnVyNzdI?=
 =?utf-8?B?eit4OGJnYnNpNVI0VXRBZGFHcGVMT2I4RCtYMXV6NzNSTzMzUFRnUms0QzJ4?=
 =?utf-8?B?VGdaRkx2QzA4dWEzd09rUktVdEJnYmh6bmtIOTk1amJpQXE3YjJrbmx3RVVB?=
 =?utf-8?B?Z2hiMTBWT0VVNy9pdHFhSysrR2RINFpvajZtMWFxbUJaclJacVVOdlByUWdV?=
 =?utf-8?B?VHJFV1ROVEp1L25sM1BlSGR6WVBkOGNFdGxHTnV4Y2d4MVdpaUFZUGlIc040?=
 =?utf-8?B?eXF6a1FRM2IwcWQ5eDcvSjFBT0k5Nk85Njk3anAzcW5FRHhrSk83S3hUd0pE?=
 =?utf-8?B?d1pBTHkyUkVnM2I4aG9HM0dONFhBKzhiQ00rK0hEcnJVbE8xSGVKMFdKaEF6?=
 =?utf-8?B?eS9LWjNsWGpnek5OdTM2NHdnanBJK1haTmtpZlNwZ3orR2d1YllhWUdQQ2dC?=
 =?utf-8?B?ZE1nR2tTNTY5d3pJMVdyRjVZelBtUkZQZlo2WjZWRGVPcUc0NTc1OEdDaWVV?=
 =?utf-8?B?SmRacmdPNDlzYkZ5c1ZHbmoxSzhPUWtUblpyeXZvVHovckkrZ0gvZUZaZUd4?=
 =?utf-8?B?UWFIMzl0MlA1ZWY1KzIxM3MwdERnVXJMNVJkdUlMWUtDS3NFdFVKRmFtbDVw?=
 =?utf-8?B?VStwdXdWQm9yaENXVG1xZTVTdk9UbURSR29GK1dFZUxGZjAwUWtzb1paRy9q?=
 =?utf-8?B?L1U3MytyTUFpVTA3ekJhMlRNS2VTZFJjNnFZWlk5dGZpVlFPUnkyMUJzUE5L?=
 =?utf-8?B?cDcwdWozMzV5Y2g5VWRQc0hlNnhHUHlrWWJqRW5tNkhMQmJvUHE5UnlTdmpj?=
 =?utf-8?B?OHVlSEdpM0NieEt0ZGlSWkRZSmZhQWN2UlJzL0ZlOCtzMkpsMW9NQXcwUzY5?=
 =?utf-8?Q?7zebRWL816HlfYeDts+GqybUR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ce7d97-b51e-412b-ebd7-08db942e6fd4
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 14:32:17.0446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sadXNYfSDTKh0P9aZnRZPoPdSA/kiXvkb3fcC0b3QWSk54DAVqxGjqfoOJ2JOmNNDQWhRcHOpjsI7tyqMDcsQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6026
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, I have sent the second patch with your suggestion.
 Please have a check. Thanks. 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.136 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.136 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qRZNJ-00C2NX-V5
Subject: Re: [f2fs-dev] [PATCH] f2fs: Only lfs mode is allowed with zoned
 block device feature
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

I have sent the second patch with your suggestion. Please have a check.

Thanks.

On 2023/8/2 22:52, Chao Yu wrote:
> On 2023/6/20 22:10, Chunhai Guo wrote:
>> Now f2fs support four block allocation modes: lfs, adaptive,
>> fragment:segment, fragment:block. Only lfs mode is allowed with zoned block
>> device feature.
>>
>> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
>> ---
>>    fs/f2fs/super.c | 12 +++++++-----
>>    1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index c917fa771f0e..6249483be905 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -861,12 +861,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>>    
>>    			if (!name)
>>    				return -ENOMEM;
>> +
>> +			if (strcmp(name, "lfs") && f2fs_sb_has_blkzoned(sbi)) {
>> +				f2fs_warn(sbi, "Only lfs mode is allowed with zoned block device feature");
>> +				kfree(name);
>> +				return -EINVAL;
>> +			}
> 
> What about:
> 
>   From f6e71f1d33c2cca543ebb41734c7a95af5190767 Mon Sep 17 00:00:00 2001
> From: Chunhai Guo <guochunhai@vivo.com>
> Date: Sun, 30 Jul 2023 10:06:50 +0800
> Subject: [PATCH] f2fs: only lfs mode is allowed with zoned block device
>    feature
> 
> Now f2fs support four block allocation modes: lfs, adaptive,
> fragment:segment, fragment:block. Only lfs mode is allowed with zoned block
> device feature.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
>    fs/f2fs/super.c | 9 ++++-----
>    1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 099e126c61e1..1d0593358125 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -864,11 +864,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>    			if (!name)
>    				return -ENOMEM;
>    			if (!strcmp(name, "adaptive")) {
> -				if (f2fs_sb_has_blkzoned(sbi)) {
> -					f2fs_warn(sbi, "adaptive mode is not allowed with zoned block device feature");
> -					kfree(name);
> -					return -EINVAL;
> -				}
>    				F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
>    			} else if (!strcmp(name, "lfs")) {
>    				F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
> @@ -1333,6 +1328,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>    			F2FS_OPTION(sbi).discard_unit =
>    					DISCARD_UNIT_SECTION;
>    		}
> +		if (F2FS_OPTION(sbi).fs_mode != FS_MODE_LFS) {
> +			f2fs_info(sbi, "Only lfs mode is allowed with zoned block device feature");
> +			return -EINVAL;
> +		}
>    #else
>    		f2fs_err(sbi, "Zoned block device support is not enabled");
>    		return -EINVAL;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
