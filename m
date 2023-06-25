Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC2873CEDA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jun 2023 09:15:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDJxT-0007SO-BQ;
	Sun, 25 Jun 2023 07:14:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qDJxR-0007SH-D7
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 07:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P1G6Wfadwgv/l69VfPNDIBbQCO6jkqI8A3ex1aoOgms=; b=XyisI9WVtD1OJEVNklno/OAWK0
 0/Lxwu35HvDdUYbPHWkVkQ2uLJRjeNhNR1VUX4eL9lorX/q/LHFPHeZ6iNI79rwxDlIwy6rKfPnxy
 E+4w/FskWCAUjUpnyLfzd3HlkQux3EZFG8cqgP+uTLQkemsGykXGinpHYmIr2Kul3dXk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P1G6Wfadwgv/l69VfPNDIBbQCO6jkqI8A3ex1aoOgms=; b=aJi4b6lyHHefXwy9VuSN99Uijh
 IguQLiR6U+pxq3haBtIRxKMNZDyvt+YwaCIvBuPwKXYNSamfKLdaT8boZ1Ql24WTOyRU56TkEWedi
 qloegLFcCnbWTiuhMyZQbIN535ox1HGvT5CumxisCEVgXuljBw8cCq7L6AeMNb9wxqFM=;
Received: from mail-tyzapc01on2123.outbound.protection.outlook.com
 ([40.107.117.123] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDJxI-00DnpV-2F for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 07:14:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnQY9qid+dh6jSD/h0mxKsqaOhQWUa6V0Z91BoLAWK0RYUpEqLa8U61oC9lZnTLpHiouOVqNHf6L26iEZUpekRiMOCJGtytxlzwkoiTdbjBElU7ncAWmw38EBOBcfPgIWyx7axLEDvg1ZmgtY9Ln5o+yxOiS3kdIokVo9ufzFyFPluNt9VtN+C3eW905L4gZIrjuIirADqeP4IHz9r/15ozo3lgUbY1+1cbGY8n6Zjz0peVaBH+LnzRxetsxgbLMeclnw/ZvqOQY/P5Hq8ZmiBR7/WV34do+U/DPeiby8VVVW/1QlTuw71pyf63WcxtcIb8y0uFEQ4UqVnMYwXz0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1G6Wfadwgv/l69VfPNDIBbQCO6jkqI8A3ex1aoOgms=;
 b=bj8T87N0jroUtdoM47xRNLM0tvGb4Rsce0+0DiTJyc3q7LrmhZ8UmI4a4hjdSAwQWCzoCyukuVBLx0iAFF0hiOyS+7z7Wb/UHsWnXubzxXZ5Rf+wMwPYOj9aZAwZ07vVUanq2uEV6lv04NYVTRsdlddYlqTZqpFP9egdpKYMD45NDFVJYq1IhQRCPiNcYFFkvpzXbzUQWOTKyhJUQ6jA2A0XNfXUn8zx1mLzgdLgrXrXrXApgen/Qp6W3NGnEWR5IvVKiOoClyv+ZYyEVhN/q0kvwEEXlDJGwXMaVn7eoOHF335iQbHZrIhBvZJLFzgZzljfqx8WIQo99fXGLMmqCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1G6Wfadwgv/l69VfPNDIBbQCO6jkqI8A3ex1aoOgms=;
 b=IvTON/ehs1l9jaBNKs5T9jhispx8Ib0IOFydBoxQIasgJf7/xv2H6/t1F0G551MFnBfPE2sbfNDQj9kB+s7pzJj9WRPLRUImhVfCV6r4F64pR8loc/3ZLZPL8cZMqzg0SrGGv+9rHEMdXMJfHJ7vdV9GNc5MY7NwuWY2A82DCyV8xaKm2YhYtXcWP55vRchKLdx+B8+Dv/nowuxT6ZThF0SmyhrKH65X557EpmdAxFV9igC7imBAMdl32HmcYU6fuObJoxp1xwPU2fQdt1QUYZVzv++/oQQYd9bEoOi6RSGHkRGUwtdnBz01+xdNo5ts00yO8eu8PkVGN4jotgP1Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by KL1PR06MB6164.apcprd06.prod.outlook.com (2603:1096:820:d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 07:14:25 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::4823:1d86:1665:5a02]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::4823:1d86:1665:5a02%7]) with mapi id 15.20.6521.024; Sun, 25 Jun 2023
 07:14:25 +0000
Message-ID: <9a994ede-b91a-6a73-c14e-35d1a062a109@vivo.com>
Date: Sun, 25 Jun 2023 15:14:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20230524024204.13694-1-guochunhai@vivo.com>
 <5dade26f-9c0c-8022-ffdc-ec844ce87f32@kernel.org>
 <ZJXpYR7eRVf+Gfj/@google.com>
In-Reply-To: <ZJXpYR7eRVf+Gfj/@google.com>
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|KL1PR06MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: b092a39b-669c-4aac-9a22-08db754bce22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nAj1a9jAzNRXvPybXcgob/kWuVxyZO8SgNqq3Xlqq6wNbM5J4dzaGF1BaE35P0wt8ZqAUzgsJYpjSrBWfBFRjiSURU6mGA6QrItVR5A2oKz5Ut9r6k/eG9N5YR3YNTMWNKyqmjoUgj4Z35eG8MmRuwaa/4on7v2AFJ8efvX1LsniyoZyAOAT5RQdlAqxX6a/1FiSVmzH+BNuYxvsESwtphA4lqijZYEFOXikd89D8a6peXT8ierfKXH2fXbkIp1ckOVe/WOubbRHP23rWZq059t1Hb+1N4EG/8UpOstJOk1zpE3q2l5TJDeChDLOg5yN+5f9ox7f61B8sGZVySHtlOif2Xi8++nYJW+seiBIo/+k2nQa+NJCkyf4XPJNoZvzih72K30h8ykqsrOKyKAL03aNHJ8cJLsVVCKM2b6ueKfU+qgGviQ5B8mGnoCB/NTeIjhH2XWA6URg6aEudhu4Cgjo6slTvR/5KE4j/c2Ov4LjUfH18FKjMH94hK+afyoTsAF+cdRxkGDjrmIINSsHkelxzAwxcjSZuc87s83qEA93AoLjI80WwHL81zOIEMiIlIFLtEI/FUMadcvKOsDRvko2ojhybkQmBJNgM+3DlPSGSjOilN8odF1FJr/eJRm7Z5toFsVkPAbPbd+XUIXHXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199021)(2906002)(4744005)(6486002)(6666004)(38100700002)(2616005)(6512007)(6506007)(26005)(186003)(53546011)(41300700001)(110136005)(54906003)(31696002)(86362001)(478600001)(316002)(36756003)(4326008)(66946007)(66556008)(66476007)(31686004)(5660300002)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFFWdWxsbXh4WExoV1ExT3l1S2hSaWlrSlBMVXdrTkYxMFNXMGIybUd6TDk5?=
 =?utf-8?B?UHc3dHErV0JjWnBUejZ2MEdMWG1PQnN5b2VwbnlQdTdpc015a2ltZi9ROWlQ?=
 =?utf-8?B?OU1LUmo4ZWFabHAxeGM5bzF6MGRoeXFEdnU3UE9idmxVa3BmUFhwWCtBdjdE?=
 =?utf-8?B?ZWRIMWlab005SUZuV1krdWZyNjBySFNVa2ZWQTJMbTQzUVFRR3Q1VXVxWWJZ?=
 =?utf-8?B?bm9sdldtOTUxWkJYV0RlT0trMmhuM0t4a0xhb1VUVERnY3pQa0ZJMGwzUFpI?=
 =?utf-8?B?S3VEM3g4VmtHVm1GZmRPUmF2NkNKU3JWazhVMFlqRXlsN1ZJd2FlSGN4dCt3?=
 =?utf-8?B?MmFWeFJMZWFrMDR6dGxaMnl2dFNFdXBxMnMxN1RCTjIra1E0citlNXhUTFJo?=
 =?utf-8?B?Smk4TEszaEFyeXQ4MCs2V1BvWHFPTjZNMzJiNmJQdHBoeTM1Uktpa2ZqdUJQ?=
 =?utf-8?B?ZHVoVjR3RmFlVXB4dXNSQmlwNStsSWhMWlFmd2grWkhMUEZnMFlSTXVHM2hM?=
 =?utf-8?B?c1NGY0d5UEFod2tLejUvZnpEekxsTzh0OFo4ZkwwekVsSTRDaE1nSzR5MUMz?=
 =?utf-8?B?UzV4ZWh4UlFJUldLQ3I3clUxWWlLcFlPYUJFS0QwUUVyV3lROGZHWFRvUVFP?=
 =?utf-8?B?VTRUTFpIS0dlUGdOSEhESHYveUx2UUE4MWNNb2VjbDVrbExQMmFIWFpKUUtr?=
 =?utf-8?B?SkxYNmVRSmtNd3c0VTlEM3lIakNSbm5GdVlyczVUcWljVXhoRVJkNzNMbCsw?=
 =?utf-8?B?OW0vcFBkYlZTWnJJcWZKeldYQXdhWllpQUZNbk5XNVRLRy83OVFQZzRaeXdJ?=
 =?utf-8?B?VkxiRFBWRUppTHZiUmFVdktvZXNIQmFtY1RiS3A1em4zTHNkQ3FsdWpBeVNY?=
 =?utf-8?B?VmdGdk42RUpRTGdaZUZ0dmxuNU5Od1NsblZSSHV3VkF4VlJRQ3kwNHp0TG5r?=
 =?utf-8?B?VDM4NUptZHhHaTUvRit6ZCtpeXBzTmdYZUh3WUNtakVSbWdLQ25pUTlVMS9F?=
 =?utf-8?B?QnJXV0VBcHhDVG10VWJSNHkvZlBRbFlZL2hmZlkzRVdBWVZacUMrdksxNk5r?=
 =?utf-8?B?d1ArR1BpYUFpZU1ydlhycCttRFNUUGI1czJIelZlMmZqSkpPcE9iZERRTE5O?=
 =?utf-8?B?bTFHMHpnVVpWUVFZamdYZnNmaWxoQURBR3p3VllWaDhnQ2FwTy9RVFV2dFVv?=
 =?utf-8?B?VTNwaUR6RmJyYmdaa09YVnJ1VzY0RTBkZWx4Y3V5NysrRTZKRWtvb0IyTGE4?=
 =?utf-8?B?MW8rdVZKakx2c0d1dUpoZUE5Wnp5ZTVyNWl2cUNKeVNSRXU4akppTlNScVU0?=
 =?utf-8?B?MWVnQkIvMDJJZ3AvVWduTXRsTjhldTRsUHRkSFRqNENvc3lGbk1BSmdwR0Zu?=
 =?utf-8?B?RXNOdC9pUzNIVG5XSzQya1I1QmtZcTF6ZnUzWi9mRkpVZis0V0ZnVXgwMWlJ?=
 =?utf-8?B?cldiaVdqZ2NYODgvM3dhN3FSY1hVNlQxVVhBUENtdEttenR0OXRaTU9JNDND?=
 =?utf-8?B?YkRORGJKYVBrTFVnNFdQUlNlMGZIRnorYnRDQ1krSTNlMHdhM3RiU0ExeFJY?=
 =?utf-8?B?R1ZKT3hFa2FvTGpzdlJZYmRmcnprSko0V2IxWUFTZHRKY3A2MHk4QkRHdEFX?=
 =?utf-8?B?RlhHbDVlRDFYRVlyaG4rNzNYVWROWS9UeE9HSHNzV001b0F4blg5VTNRamFq?=
 =?utf-8?B?UDVYMGNHWHpiTWpLaVVIQmZJa3JDZEc4cWg0RkZxMU5XQm1pamNUM2J6UW84?=
 =?utf-8?B?ajNBMHNZc0xsZWc5dWRzZjJuMGR3Z3hDT1RZMTZQZ0lQNkpXNUtjQWVtYWo0?=
 =?utf-8?B?N2JGd1UxOU9pek1rOGVnSEhYOWIrdkhMMnhtOU1VMFYzdkd0cnBMaGR2T1BB?=
 =?utf-8?B?enRuOFFVclFtUkxRbmNEdHBucDBkM2xlVHpSQXBzR0d3TjZPTkFqd29JQUxh?=
 =?utf-8?B?N3ZNRXhjTGxPWCtiU2JscWhpV3VDZ1cwTk9ZZVZZbDh6N0h2K3hNVEdPVUR2?=
 =?utf-8?B?VE5BcDVOQzBwbEhVN0JQdDAyeUxtalJlWGVxNEUzaHQzSlVtTWFyckhkdUwy?=
 =?utf-8?B?TEt0RzFGRkhNWkYwMlFYSmxXYTl4T1kxcERtaWQ0WW5LallTT3UrSUNYWHhQ?=
 =?utf-8?Q?1s8+q5UTwV5f1YGd+2wO0MoHW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b092a39b-669c-4aac-9a22-08db754bce22
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2023 07:14:25.1101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+ZbZUydZiN92+u44U4c2Woe6lclzEj3xGjHxRUHPnZx0wdYgVSW5ECmOVst0O4nV1Fkn3ScH0awv7ZUPH6prw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6164
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk & Chao, OK. I will post a final version including
 the modification. Thanks. 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.123 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.123 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qDJxI-00DnpV-2F
Subject: Re: [f2fs-dev] [PATCH v8] fsck.f2fs: Detect and fix looped node
 chain efficiently
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
 <linux-f2fs-devel@lists.sourceforge.net>,
 =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk & Chao,

OK. I will post a final version including the modification.

Thanks.

On 2023/6/24 2:50, Jaegeuk Kim wrote:
> On 06/23, Chao Yu wrote:
>> On 2023/5/24 10:42, Chunhai Guo wrote:
>>> +		if (!c.fix_on) {
>>>    			err = -1;
>>>    			break;
>>>    		}
>>
>> One more comment.
>>
>> I guess we'd better skip find_fsync_inode() and continue fsck rather
>> than exiting directly if c.fix_on is not set, thoughts?
> 
> Chunhai, could you please post a final version of this patch?
> 
>>
>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
