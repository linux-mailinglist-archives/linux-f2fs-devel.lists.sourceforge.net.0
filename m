Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2402D84515E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Feb 2024 07:30:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVQaG-0002gw-Or;
	Thu, 01 Feb 2024 06:30:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xirui.zhang@vivo.com>) id 1rVQaE-0002gp-QL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 06:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DoAGZFzhv61zQADfoo/pMiJbYX/ETTLdv+d66iNh3cE=; b=bHJU0in+4xWD5Yi2vGTJNrB226
 OJjltIuOLZJfKUXZltS/YeFJHTx3j46aHpdWUahQpGl/aU0646vbz6eSI9X5E77FbfktcLE8IY3rD
 RBLA9XeXe9KOO/nhR77iDHDjbYqgujeRPQ6q1MNlrj63S94m6fN9JdUMi5PftLjBdsQg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DoAGZFzhv61zQADfoo/pMiJbYX/ETTLdv+d66iNh3cE=; b=CcFDm6bWjwFtQHjNw/yKwoZksC
 BlWJxsFSffeB8GYadsIHsv94aELVpoRxGxbDFWfkKrj1zqN5nPM+RRe5HmVAVxqYiP56BwHh/9Zlf
 5u8b1DY8xjgpDE3Ru6VHIJajh4GpkqcPox1tLa2DuNM61lN+QN06ZRlxB9V3OC7Y6yPE=;
Received: from mail-tyzapc01on2058.outbound.protection.outlook.com
 ([40.107.117.58] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rVQaD-0005iu-Cn for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 06:29:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZMCstjK5Wk+9DLARt18SamqYTL1ikx5tPiPOzE5RP8hN127xN3MWHvlub45IjRdha/ay+QaDsRlT6ZhCl858gTNBW9dV3OiLlYWCwhDgeqYJiFn62bRWlUhpLs4oGrz3ZnG66vuw8VYSk5es12ISMXr0bDrRNxsI/mo+XKJ7ecwyT0cZ1VR5wI+2rFdIEjgcip2SpAv4bP7/HpwXD11skcpkM9msJsS1dKhTt3BSg5LQHK+JAuwaXNQ6EkLTE45ewSyOriMjmUqoa3WgEwxHLs9m5tZYtFo51xkB+S461v5sUpk1W/NhGuod5ppghPr6Qx60Y9lsl0M3MSf6SDekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoAGZFzhv61zQADfoo/pMiJbYX/ETTLdv+d66iNh3cE=;
 b=cGVzhBfd34CG5ms7Z+XnpZRvxZ43ACJWkYjOti/O3syqKcaHTUCGP54WSv0Mf6XHGRc87b3DRT9HIigKeyek/WRqn5cCX53STEyutiNkg/AEVkjEmh3SFxaWMIlOIe27CiRWn3XXzjLuQIxOFxnw7J7sbGdODXlH8wpsbmRk7eIegj3HeyYM0h0OdiM2+8tigpHEsWLlV46CnfW82EkRisjG70gQryk9lSN0zWSJJKFI+ODE3YsTC7133pzyVdRihfn7/0GR5NzUKBukT59xJfn1EfbOCSRTTXXJlpQO9zBbcL6+c6ltdR0edDmTVKN8rzy0GkWrCD1B6VOjSvjT/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoAGZFzhv61zQADfoo/pMiJbYX/ETTLdv+d66iNh3cE=;
 b=K81wSVxjQvxnY6KFMgyZ4Bfd/CTTvpTJwJh824c7oSocVuVEVCXubLAokGYqokJyVz/6gMhxcdtdEOb0KwnLLzv5S/LB0J+l+DjIUJycN21ftyOSVo2Bngrd1LVnsnYXMiQp4XYp/Uv+ZDFrvYt2oFheswtvt59XA+/9z1omUeSq+9e6w06YPYVpnZLIvYHFIMs8MR+npMUzYPK/RbfF7qWVOopAkQimPVhwIo5/NuqTBpjWWzWw9hHEAXT/f9jzrrRq1eLOk8AwqD3yRtB5li/fpq4ZF0NQFsTJ4Y72j51h+oFOZ3uYLONTGFdkuXEUxtpBrNEBJID9SsL8CCsFSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5178.apcprd06.prod.outlook.com (2603:1096:400:1f7::12)
 by SEZPR06MB6488.apcprd06.prod.outlook.com (2603:1096:101:18a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Thu, 1 Feb
 2024 06:29:41 +0000
Received: from TYZPR06MB5178.apcprd06.prod.outlook.com
 ([fe80::6b44:2bf:dafe:c2f6]) by TYZPR06MB5178.apcprd06.prod.outlook.com
 ([fe80::6b44:2bf:dafe:c2f6%3]) with mapi id 15.20.7249.023; Thu, 1 Feb 2024
 06:29:41 +0000
To: chao@kernel.org
Date: Wed, 31 Jan 2024 23:40:43 -0700
Message-Id: <20240201064043.4082115-1-xirui.zhang@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <dec7e126-9fbe-45b7-b661-6464ac5261fb@kernel.org>
References: <dec7e126-9fbe-45b7-b661-6464ac5261fb@kernel.org>
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To TYZPR06MB5178.apcprd06.prod.outlook.com
 (2603:1096:400:1f7::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5178:EE_|SEZPR06MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: b50cb1bb-184e-4ddf-06bc-08dc22ef2c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0SWU5Xnw2s33kFIZvdw+u7QkdW2fxs/SmKUKIy45HyUrgmwe0ET77XmrJieRm3TnApoMWu73vK2rpYJstHeRxjSbO0SYLRloKdot4PL7jo9MvYKjKBJGxApmVor29fy2+luHZJkF/rBANkaineTH04O7NMDaD6TZiScFTZxQNgS/IYZzX9c2rBnnvoCtUeRiYZRPum3EI0ZkssTFcbK06IDmkVCCMDwzkLpyxzApgoFrFYYOBwF19TWvv8MNXdBQwGiV87cxRsVZQ6j+KlxRRNIYyQKNCFo003JRl8YRvt+onhYud0Udenw+mq40H8lI77QGME4Kx+oBiLz58ugZVNb5GmlbQGdlcXwU85F5NsO3FISjZcDIEfLJefAWSiF8Z359IhoxOVQzcoFF/VEgwxrey1VfxhoRlWhk5y3n2+tryqt4Fs9MTu6claEBaVZg64MseKtwA/za3ofAIYDm9/IlbAiSG/HPFdc1gQ21ug79ZBU9erTgZVWveUh9xi6nZeK65qc0A5XDnxUetcfuuLe21dOHjfFjETl70WBIrn37qB1ZVLINjuAkBehaA7Q5+swfh+LhvRxkg2WcBtgTJAzrSxReTE+pzlCcO7eZtjk1Htok32lrBZSuYb7hXoDJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5178.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(8936002)(8676002)(478600001)(66946007)(6486002)(66476007)(66556008)(316002)(6916009)(86362001)(2906002)(36756003)(38350700005)(5660300002)(83380400001)(6512007)(38100700002)(41300700001)(1076003)(26005)(107886003)(2616005)(53546011)(52116002)(6506007)(43062008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IGa0eBCsxkN+mJpIwY3FkFGXjTmCL2AXVRjv56DdZVGtzuJO7/1ZPpttEYxK?=
 =?us-ascii?Q?ezeDwPvVQe+8xTHOjPQlzNGO0Xt6Te8UaaJz0+jh9JdK6T0LfBPf0JzdF1kQ?=
 =?us-ascii?Q?YYi5vQlgFp/GbvRvRKVR6FIDDV2KSct6+87ePmCYPfHx3crFO6oXIQHqq6+K?=
 =?us-ascii?Q?j4FpwvCxRtOrMdpGsXZyvdzcf6MI9svG/Fq4uS5oDA0E6MpJJS3i248Tah7c?=
 =?us-ascii?Q?C/OsOlQWBMJMnmFnxCwkjKHKExJnD/ljkMSA0anRh8MLcmCkQAkQusjAObFR?=
 =?us-ascii?Q?4rn0hEwOaoda0VCjcupPIOVl+IADl56XcJ6ISkENfwl/IoaU9mSMHHPgUM0/?=
 =?us-ascii?Q?hPovJhDmcP1YJY/CfMDiir/23T+l3IHJ2eoBKsIbdpRj4mLtqcvsgFDavjvf?=
 =?us-ascii?Q?2U8eXXPuZ5Lfu5nmLGTyNUf3j80Yqw47KACGpmpQmjlTPg4FtWkKwgrGwMbi?=
 =?us-ascii?Q?nlgS6DfswoDCOpbfKXiCiSQ36SJM9bjiXfoBqOLtzfshAoxbCniR87bCoWc5?=
 =?us-ascii?Q?Nlf3btuZZhHWIf0YIB6cNzbJ8Dh2jd3QBC/P8iRHksFwSrhyy+AWr7XOKBIv?=
 =?us-ascii?Q?cjPi7A7WqS/RtAaWHFIhLTshTXhdGmgpGxbr5jfKN53ltTHQaAc0J0LXYihZ?=
 =?us-ascii?Q?TytDohIEhxk9jTch0p9AmyeiP6o+cPTQZknTCMrfRo8W8ExZOwYDdWUvKHqy?=
 =?us-ascii?Q?keBwj+jfM1oo8pUlcPs+yl1IZC3QjA9mICkKvbcgY7IFDTK3nI3vd4oXvYpS?=
 =?us-ascii?Q?Ufs5ldXc+9dxbTqld62ai4p4P/aSfHzGrenZQ+Y13qGYM5GU/jMtgAtLSmHE?=
 =?us-ascii?Q?Q0qZMgNklrUQAL+OmOq18RKBBb6FjCxQRtXmCte7ofrvs3thJcTA8LYnR/Uq?=
 =?us-ascii?Q?96JfHQ3kkzKZseiumDcAYNMo7tV5F+pn5wOjs5ULMTEsZPkC55Nc0s+tZ2US?=
 =?us-ascii?Q?ZvBdt90ZpvbzStFLBq874eMFcVdKf3TobXsCIe2LGzTeE6vDE++oI82J5QPZ?=
 =?us-ascii?Q?4Sc51kQmABfvYGeLKEQGkr4Eu+eXTNi2T8TwMR6buZxj+EiNPD2HhAZGsdsT?=
 =?us-ascii?Q?s7JoYz6SjyhDSfyUlJ0zrri05DksflqWTYfv3DQQnZq5xSH4xWawIAc3waN4?=
 =?us-ascii?Q?xpa3DWUKUGwPosteqvC9DIpQI8I8MprbbeU2A5vYT/cvRTOCaG2TbzxaxDWJ?=
 =?us-ascii?Q?BBsFqd1yiT+iosEbTApWkoDMpXRnuf/RQBYKUUsw1zNYwoJZyiaWhjV5Ife8?=
 =?us-ascii?Q?Y3mV2IEH0/4y6DHpgloT+qGh9k1UpSGt8t8ZeQGfCYcKBpZR3mzJOXMAw3J0?=
 =?us-ascii?Q?BQw4KQT977rF9LJThwZ9X+1OJorZ03ElQtqx5Dgo78fZ6vqtz9TBc2fGwMyu?=
 =?us-ascii?Q?xXHwuO2Y3kmq5t2GhIeNc3TSmcVL3rxVYG31e+29HfqY6HJDCdzNAx+3d6k4?=
 =?us-ascii?Q?dptjXcu2SN9xpJyvsT1QBNEiD8kqWb8hQdF59cdua9tKVs1bK2OytlXLEr6/?=
 =?us-ascii?Q?LqaMypCT5Gdqo4QfJlBH4SmgBP7QyWNWceVj3qLsAyAc/ALeEB0FlUwbmL9O?=
 =?us-ascii?Q?MaqurGQYpnWcSwVZv4zzYIeqJ1PzCopPVKvciWYU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50cb1bb-184e-4ddf-06bc-08dc22ef2c08
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5178.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 06:29:41.3648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptVhtn1jibJtusHfa3wQ+4T3hrFPW2Od3zYJbRKonc7rBuBFpqC7zhw9P2ibcAsWhoFP9qISBcNEfl7NB4GwCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6488
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/26 14:37, zhangxirui wrote: >> In sparse mode we
 just read or write to a sparse file not a block device >> so no need to check
 device mount state in sparse mode. > >I guess it needs to check [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.58 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.58 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rVQaD-0005iu-Cn
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

On 2024/1/26 14:37, zhangxirui wrote:
>> In sparse mode we just read or write to a sparse file not a block device
>> so no need to check device mount state in sparse mode.
>
>I guess it needs to check whether regular file was a backfile of mounted
>loop device, so we can only skip block device related check?
>
>https://lore.kernel.org/linux-f2fs-devel/20240131073425.4043962-1-chao@kernel.org
>
>Thanks,

Ah, yes, it needs to check whether regular file was a backfile of mounted loop devce,
but it does not conflict with skip check device mount state in sparse mode.

Sparse file is Android only for making userdata.img or other rw partion image, in this case
i guess we will not mkfs to a backfile of mounted loop device, right? skip check mount state is more efficient.

>
>>
>> Signed-off-by: zhangxirui <xirui.zhang@vivo.com>
>> ---
>>   lib/libf2fs.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
>> index 2451201..5315de2 100644
>> --- a/lib/libf2fs.c
>> +++ b/lib/libf2fs.c
>> @@ -830,6 +830,10 @@ int f2fs_devs_are_umounted(void)
>>   {
>>   	int i;
>>
>> +	/*no need to check device mount state in sparse mode*/
>> +	if (c.sparse_mode)
>> +		return 0;
>> +
>>   	for (i = 0; i < c.ndevs; i++)
>>   		if (f2fs_dev_is_umounted((char *)c.devices[i].path))
>>   			return -1;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
