Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 488868451DB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Feb 2024 08:21:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVRO5-0005pf-6P;
	Thu, 01 Feb 2024 07:21:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xirui.zhang@vivo.com>) id 1rVRO3-0005pY-8p
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 07:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=atIO3a/DeYXDFW7RPJS47d65tmEd7fDaeKAwPgM56vw=; b=RopuXZCgotDsasPe/85Lz4f18L
 3U7xOz5FHR5Rt+3yXZYNMzxSL2xCR2W60R56lHjy7mznbfRUsCexQ8HXl49Ct/6c9uLKU0WbLncpl
 scXGFK04/QzMFV04vt8P+oidKPwpKSLRv1+9zr68dKazMVFLhfdV+hQdvfnmVnz5fiJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=atIO3a/DeYXDFW7RPJS47d65tmEd7fDaeKAwPgM56vw=; b=UA5jE8Cc4Bg+mUaKPeI5ACokGl
 9b1Fgs5SaVY0bMnMNxi2Q0VUgNRuzgFF5YMiiOQCur0BFhn+4FerkKfx6FxjISfBQppR9xOFVgrtr
 G5v1aAqphx0GpoUU3ZwHSvdqhjcjXgH/BkITX1Kr2Y9jKZbKGvtGNJqvt9DsfFVaERh8=;
Received: from mail-tyzapc01on2086.outbound.protection.outlook.com
 ([40.107.117.86] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rVRNz-0003Pk-03 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 07:21:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrZV6mFW8MP8Y8GZQCx0l28lCb8JYYlfsjLLIK8G1Gy3+DfVbghgluJbw/wO4zWRX8ckdTbxuVyiLK+znkS2TTKr5g0yyySQNqVNgLtyjbmLpeJmR4gVvnDDagcqrD3GPdFAQqSpdtuVw4k1/ljBeg++bfCrv7/Q54YG8cKTbMijJKe+yaqLrQns3KEw8b5Nuue2k63Z3RtQ0Y54vm2y5SEpN/PeO8gzH3mEsaAt7M58kjkC6ND8pYLq3IQ5pUWjHjTxSK7B0ikP6TnVpaP3YrLlcFSrpq/u2BMWynNBpT4+azjsXMh27WOznbtxf+2sVBCGzad6PPKgCKfQVsCwaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atIO3a/DeYXDFW7RPJS47d65tmEd7fDaeKAwPgM56vw=;
 b=MvJXxqpxcktBFOrZsES+M2n6xzISO66Z8AfVruMjvIMNe7h4xvvTw05LSJcUCnngSB+MSvHUYSS0nILOW0ECNWIiQx9KIw9vv5OSdZ1um4l8Vssz5BMrDwyJSfS2oFIpfweSXSXfU12GZPUkW/dXyYllK1bp4/GVqq3f0FN8GuFTjEqNiQ1vcDKihHhK9E5xNVh4TOGFnLWpZBC3rPO7r4aP7xSJ0UsOHXCJCNq7SY/luBOsAX8xb5KsX1JBOxsmLO9RlkFEZ2lTenL82gbQH/TJ8nHihilEsipRXxc4CmziNUE0ADtkOrJGuwrUYD8A2B4RNf6sqzNxu/TTON9Dog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atIO3a/DeYXDFW7RPJS47d65tmEd7fDaeKAwPgM56vw=;
 b=B6ACE7MJSyrEbiEMq7YIJCMufoAvE1qdYfQ8fJTFcSnVmNs43oOt0pnErfbo33J0/UKGAq4I0w3G6gQNJvY0aGrVyv2NC4+ewyJXlLbw9NgeY//qzipV4KxGgAUXJI6FpJNvvjKSkvCQVAvr1LcPPZvwU3zltnmlMb/Nv8apWVMxQqJ4Vl2+PMMQyNHg84KbN37hRdDkfcm3fA+dRy6Z+LbItSjL2DrhbIcfofJZo5qsK13Bn/0wNYQo/lpddfjAZtp7bU4CDgLX1w4PQcvYq2ZgYLR3eDgIQ2mt8HiWUlUSICkLTxxsRKQ8A4gFhHJ3VFa7hO6jfr0ixx2RIQkrmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5178.apcprd06.prod.outlook.com (2603:1096:400:1f7::12)
 by JH0PR06MB7509.apcprd06.prod.outlook.com (2603:1096:990:87::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 07:06:40 +0000
Received: from TYZPR06MB5178.apcprd06.prod.outlook.com
 ([fe80::6b44:2bf:dafe:c2f6]) by TYZPR06MB5178.apcprd06.prod.outlook.com
 ([fe80::6b44:2bf:dafe:c2f6%3]) with mapi id 15.20.7249.023; Thu, 1 Feb 2024
 07:06:40 +0000
To: chao@kernel.org
Date: Thu,  1 Feb 2024 00:17:44 -0700
Message-Id: <20240201071744.4086682-1-xirui.zhang@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <dec7e126-9fbe-45b7-b661-6464ac5261fb@kernel.org>
References: <dec7e126-9fbe-45b7-b661-6464ac5261fb@kernel.org>
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To TYZPR06MB5178.apcprd06.prod.outlook.com
 (2603:1096:400:1f7::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5178:EE_|JH0PR06MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0dd9c2-794b-4d6f-edc9-08dc22f456dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cbiB3n0ClwVRY1hKs7F7JYAqI74wZkvpEbAxq+1ZBNgGh2VibIh7rAGgaQcODbuiOYYEeXlMeS9Jv7xj3Ua0xUaW05Hczu7syII9FA51X9LY3TtrmtGfy+1qDMvT/7mOMykxd4fca7e4BZ3QdoUN0tRKRGhA48zsI1zCmmdgtiYtDMqvKLX62Ro+TQ0hKx1KRpsDn0ubggwuPV6T/fDFdKZpLTUKUp1bw9i0zKHUYYFCxyw/Ru3Ng5eqSnvMkM91wAMaA9FaXAzUr5yUvc7WaHArwcqmCKLcejHpb+COFS0thPh90Fx1iQtD+BzzWBxkNi6JpgmUOIQoYba0jn73EZS7A4541gbjd/ZAKsdeeIKSSnroCwVddtqYssYuqXcGOw/e2SQJa+YRLeOnQPc9QPChem6sNN69/xBa84sTgpDZLobSWFfDJLdJQv0U6oGmRXRyYxHeIWjy/bHz02Gf04x/UMUC/RwUTmQSEn7Gze86swDM0+Cadxx5w/bWBJSCPjIVO4fp+5P6SVlVziL3GTVt3QR9nF5+NaiCksoCYKOnidGP9AuzaJv5WmbNtQ7wKWEgdzswB9sGnsSQGMBmwCntm0wVqGRl5BN+g1G0hTmIiyAdTjopndhiDp4beYWd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5178.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(107886003)(1076003)(2616005)(966005)(6486002)(83380400001)(36756003)(478600001)(26005)(6512007)(6506007)(38350700005)(38100700002)(52116002)(53546011)(66946007)(4326008)(66476007)(2906002)(5660300002)(316002)(6916009)(8936002)(66556008)(8676002)(86362001)(43062008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8ORlscRXI/tg5tVdG2qxHqYqVR9z7VB2G7XlwEkBgsY0K7rJ1PSgUBUfGLyM?=
 =?us-ascii?Q?v45+6CoTcrjRVIl91LnVpTKSbYIIsrzIJxz69rU4GbVqOy1lBRP3AmUzzC/P?=
 =?us-ascii?Q?jMISLJV899+xzeIV/ovYUxHFl6Lgtf0t4KMA3OSPS2292pa/ul4dUqyHU+aA?=
 =?us-ascii?Q?LuX9OCuIqRzUPjqIHeMeG3goYAKmZEAJBATTYeUedvKDnNWphQpdVTM1VqZ3?=
 =?us-ascii?Q?i9MfL+fCDbO2q5mMbMeWaNVcAVHnVXrtg9wJD44A6chDGn7iIIw20JA31m+C?=
 =?us-ascii?Q?FJp12EGGeMlLKxslaF1asIMuMxfLWxHa7YncMtJL5celpXyf0xQis2e3MBwg?=
 =?us-ascii?Q?oaKIxi4BsmpXyAvmO19Fs5nD23viJ2U4W5RI4XbA8ngsC9b3HxlIMY+4Y8oY?=
 =?us-ascii?Q?ScXvbIc0lGKVxl4D5KtgxNDDgjpCwSw5dFP49lBeCES2PQjtlLku9vaDAQl3?=
 =?us-ascii?Q?HxKxWEtdVokngnX7xLUZp0E4LaDfP+svBFfwAIbxDin6ZCWg/9l8OjvxXCKs?=
 =?us-ascii?Q?RKE/peC1w/9U32jDTWVCeJwctfXOLT1GGPV2iMlAgDHXRROwtmIj0Q9PB1WB?=
 =?us-ascii?Q?Xk1t9v41wz9AGHk/hn51tKQknu4KY3x6JjZOwPdJ3Jn5RkSxmozL8o/Wg9Ri?=
 =?us-ascii?Q?w6T6PmKsT+xyStfJGCee2fcm1KbQolFcCGwI0VdYqxc98ASmpfIvG6HQV5fF?=
 =?us-ascii?Q?4o8fsWSn8e8K9pfXVhd5Wcpn80f2apIQqOks0q3OoVfc6XI/yPXgO6TpuGC5?=
 =?us-ascii?Q?ScCZ/HD7QdD/VSn5M8ZysrtyGqJva2lUcE6srGH1iFWtS5MRbpTSwMOgWPTH?=
 =?us-ascii?Q?Zf2ALZhKJBJGW3+AvLTSVjxur4f7+EokaAuMlT12XrS1awH8B0YCZzv8s/pP?=
 =?us-ascii?Q?8CLY/fgNTzH5k6VlRWokf88KMu1k3QaSkB6iPxFw5IF5v/O9/iMKyjUdOCxh?=
 =?us-ascii?Q?hqxfSBNFwFpDuRl5jVJqNuMHFwbcqlYlWKswDj6ziAAucdlNtnsSZrzmv1wW?=
 =?us-ascii?Q?zqAFrdJpPC2Eug9BE0juSS0jrxXBtulcqOT/HGLQD3SxMD93Z3bTW/7FZZ8h?=
 =?us-ascii?Q?NbE/0p6dWMUiJnK7THmW+6FRWwNApQplkMuqhPoVDE/uo8i2j1BgJtQERh4g?=
 =?us-ascii?Q?ik2PCMP08DA66+x5hC/Gd2c41+Ude/dBLvy4MG+BJUDnLOkD4/nPtlMPC3L7?=
 =?us-ascii?Q?j2RzJjb5wfGNV1Jo6KzL+zv7ygb0XpgrBRGMAOhi2uE2X7XmxkUDMg/nIyFV?=
 =?us-ascii?Q?BIrKw/GoL96qwIQSf8xgkUyEln/HcMSzo9/itXJHFItBEx8jy4IB7NGbpAsa?=
 =?us-ascii?Q?6C6t/8EXxIPpFtR5V8IFS77MW0tC7xLnsFpBqOQ/fiDFL12btbojf6xj/axa?=
 =?us-ascii?Q?K04yogPuJrnpZ5Gr8uwMfHT398nMZoFHlKtvTDd/mMFcLkxgBVtde0JrxyJO?=
 =?us-ascii?Q?38wWkyRZFQWGja59r76ORahdEQFTA5pLKS5iUhG/i+eyNUWw/LdH0z1F1Omy?=
 =?us-ascii?Q?1eBWnVfP9yEcbBYUhwUnAd0gVWWcxbNea/tDt3B8PRSWKvrZQabeWhtCvHxn?=
 =?us-ascii?Q?qGPRZKfqgLgbPtrjzTQITSybejwUxKh2OysBYb86?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0dd9c2-794b-4d6f-edc9-08dc22f456dd
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5178.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 07:06:40.6009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/f49uCDpUozW687QQAH+Vr/JqVO6bUBKGtu3KFERSuWbtZ/eUPw+H059a8KSje4TAV02zZprLm46T4An+VLxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7509
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 2024/2/1 14:40, zhangxirui wrote: >> On 2024/1/26 14:37, 
 zhangxirui wrote: >>>> In sparse mode we just read or write to a sparse file
 not a block device >>>> so no need to check device mount state [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.86 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.86 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rVRNz-0003Pk-03
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: skip check device mount state in
 sparse mode
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
From: zhangxirui via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhangxirui <xirui.zhang@vivo.com>
Cc: jaegeuk@kernel.org, xirui.zhang@vivo.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>On 2024/2/1 14:40, zhangxirui wrote:
>> On 2024/1/26 14:37, zhangxirui wrote:
>>>> In sparse mode we just read or write to a sparse file not a block device
>>>> so no need to check device mount state in sparse mode.
>>>
>>> I guess it needs to check whether regular file was a backfile of mounted
>>> loop device, so we can only skip block device related check?
>>>
>>> https://lore.kernel.org/linux-f2fs-devel/20240131073425.4043962-1-chao@kernel.org
>>>
>>> Thanks,
>>
>> Ah, yes, it needs to check whether regular file was a backfile of mounted loop devce,
>> but it does not conflict with skip check device mount state in sparse mode.
>>
>> Sparse file is Android only for making userdata.img or other rw partion image, in this case
>> i guess we will not mkfs to a backfile of mounted loop device, right? skip check mount state is more efficient.
>
>But this patch leaves a hole to mkfs backfile of loop device w/ -S option
>in non-Android system, right?
>
>Thanks,
>
Ok, get it.

Thanks

>>
>>>
>>>>
>>>> Signed-off-by: zhangxirui <xirui.zhang@vivo.com>
>>>> ---
>>>>    lib/libf2fs.c | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
>>>> index 2451201..5315de2 100644
>>>> --- a/lib/libf2fs.c
>>>> +++ b/lib/libf2fs.c
>>>> @@ -830,6 +830,10 @@ int f2fs_devs_are_umounted(void)
>>>>    {
>>>>    	int i;
>>>>
>>>> +	/*no need to check device mount state in sparse mode*/
>>>> +	if (c.sparse_mode)
>>>> +		return 0;
>>>> +
>>>>    	for (i = 0; i < c.ndevs; i++)
>>>>    		if (f2fs_dev_is_umounted((char *)c.devices[i].path))
>>>>    			return -1;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
