Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93243705E7C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 06:00:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pz8Km-0005Vn-TM;
	Wed, 17 May 2023 04:00:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1pz8Kk-0005Vf-NP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 04:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ecbz7H5ZAwhkF6PZ7WGk5rcrvzRtxfY/LpVtsGRuOic=; b=BeTTHVdo/EYG4vd1XA5GzppPo0
 wvJKqsxuAQr5OKXmJmjd+UcmbFHUahsZIcEtwdYlb3Mjx0TvqOwH+IHuK5LtF6a2LoXZZ8SEFQyQS
 mSByDMP1NQ2PvtL5/Vx/tG9CccNJUFuX7wWtHOJzWHjuuHJe3JaO/7Cn2eiKqOxLSPOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ecbz7H5ZAwhkF6PZ7WGk5rcrvzRtxfY/LpVtsGRuOic=; b=Gm0y9sDQZuirkZoZS83ket4Td2
 U+cFudtWxMyVoM7MXlVXUE3Lc7IC7m/F5YAmeS1LWfwR9+bycwyyY/smTCJbX1NEOuGtZlqg1qqjt
 VX/t5I15IrMN/0UHALFgsOyeLMCWJyJSxHXm6Mb5s0kSNXLej6RB8S18pmsPcETBqRDU=;
Received: from mail-sgaapc01on2122.outbound.protection.outlook.com
 ([40.107.215.122] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pz8Kg-00AW9U-HU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 04:00:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSNw6/u+0tOtEUksWYjqhOCfC1iylY0lxr1M6p9FOLWvazEC33XQJmEGToFYhiu9zCrJbb2o2lelFHhSxJspejI5g4h8k/GsiE8cnTpa3gcc/aKyny6/xndWmnwWl9lDqgC4rriqyz26teUXLfnJUCY2RApdpg1qBzH3xNPQ/1PCKCekly41jvutOqTtZNOS4D2xAlr56J3hdXiGD0KHxZKk75fPM15qejfGMFCNJAxZhXVWigOiTnskjWL8jL/H+bi6JqoFLfvPUJjBI+JM4x394MAS/jid2UNUhalaRCbwdlKOWDuIQ/RqlmLIJIFGxFyCrFQpYhIBN99wuLZtvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecbz7H5ZAwhkF6PZ7WGk5rcrvzRtxfY/LpVtsGRuOic=;
 b=YFelBoE6PEe166jXtiXnsItB2l5PTTUpBbb/aa15UzDkUTrZ/o8e/x8CNSNDyPUFeswwl+CrbUqX+orrxRNTf8g5elVACrcQDe1nGPBGPeDUQ6FY1M/5P2O5qA+AMPHDyyxTaZebjszMxknrjh43ilaUYsPWI/ApbuZmyGEOiUkS5cd/nBVV9kzMmJUufUDBEf2r4SCKmlrPfB/es0/ZgR9AQ4/WClptkm9sCcS1oCrCmaN7sDrlt6JMMF8ybFOFhH0zMAxG7DEyPvvnqSpnO+XVa6TxJeQrMKq+N6o7HyQ3wOdTFuz0XHNrMof/PpJvQZXA+oZrtYXleiVUGrwl3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecbz7H5ZAwhkF6PZ7WGk5rcrvzRtxfY/LpVtsGRuOic=;
 b=O3NE3WA5T+n03HFpnNdqEXurmMc563Ym5N6bgjbfREr2YR2pRf8axeN0XjS3n7ETvTWabBX2K9Nv6NvFg0t3CPGrFzMFIM3G3MShPpXHjfHPcLG0Hh/0+Cf7MNKz2NYe56teSFWoqFSlxC2paMPDAZRag3EVLrj0+UCVZXMXp8JDB5vRIlvLk2LZalgNQx3gozipj4y7Zh7aunSb3ZUen2Ws2NReSlNJDZAmtvUdL64rYNAgTppeTXuAI7yQXmsCFyVn0sDBqxNZPKcvMc9o4c95wWRTxbVNxaW/07nu5t9pZJvqGAGLOfILzJPa6ns952mwZ4/aXI72aLrvj8cCGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by KL1PR0601MB3988.apcprd06.prod.outlook.com (2603:1096:820:2d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.34; Wed, 17 May
 2023 04:00:02 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::b895:d992:299e:32d4]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::b895:d992:299e:32d4%6]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 04:00:02 +0000
To: chao@kernel.org
Date: Wed, 17 May 2023 11:59:53 +0800
Message-Id: <20230517035953.47810-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <45eb63c6-a147-776a-99b5-7ac06848ede8@kernel.org>
References: <45eb63c6-a147-776a-99b5-7ac06848ede8@kernel.org>
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|KL1PR0601MB3988:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b2e720a-6aa6-46cc-b17f-08db568b309a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2FheQkPGK+cY+yxf9CV88PK0kiIYEJNZD0ypnbTS0LThaGo0x2Y2kK0ycfSAZZ3+hU50YUEt3NnFqVx/CkrbPjrLwrmu4XwhTEIDeyChI3V2ZKH8NP6akMUishd8zsVZtVI1qTrjQ+IdhOi9Q2RDqL6G5dd6YZCMAP/U27DYyrRV5ZUPs44XT6eKmzcotgibJfkOttjZHrXakkMXzkJll+Pl1Ro4tRIgR/RjwHs2kO3y11f+NXfs4SrMn4IC1hgeykMyWxxrhi9bo0lQEOjRdP+ZO9jY/lqvmPQtNI7bIP6VJQwU7h0zZ/wKORFcgEaJfn9nnS3mzWkgZG9fILgyMFHgbFkzOsMiD//2uFRZeE/RSwNr10bXI3Hx93mrGbDaC+FxDNpoPu2SIQX4MJCXsEQSLkuUfreq8bYK5nG4QSUllguG47JIA1YCy1+u3T4k/TAVaDjz2tas54Zpm2XL1U1nF+UI/B1SaL29H4AQEg6Y2IhNFq962D4xLqtGYHyPQc0AqLw5OlI3w1EuBv2+e1ZiV9FCr7zhnDVvvMr2rVGhGks4LsPErAA6K+/YX/3v9jKRGDJ2g0UOKQMYRG9VIdwpsOY9LV1n544+iC/kqz0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199021)(83380400001)(53546011)(966005)(478600001)(6666004)(6486002)(52116002)(2616005)(6506007)(26005)(1076003)(186003)(6512007)(2906002)(36756003)(4326008)(38350700002)(38100700002)(6916009)(66946007)(66476007)(66556008)(41300700001)(5660300002)(316002)(8676002)(8936002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uIFjZyV+inuMZMN+BS3KKIm6oYTvj623HNhmSUxenoP2rIq/bIx7+vLp4EcF?=
 =?us-ascii?Q?/aycpkPT349tzjxDJSiXyLbPP+k3WRMfnun7+SPpLQSp7kYlOIGOyd4sfULU?=
 =?us-ascii?Q?1yIWW1s/etzKfcKfNRHwxUGHAgOcrcWnFeqV939vzUvoIuT7224vO0x2NSG9?=
 =?us-ascii?Q?aCWBarNBcQFyR8kKnqoyCFnsEQuB1g7q2fDdwgsthghLB/8fhag7Kwn3bsiD?=
 =?us-ascii?Q?aGju500AdMcYKJH0heXNSct1E/h0TM3pXRV1zR3eCHKLju2F5t2a2iJwlkhP?=
 =?us-ascii?Q?SH4iT8qDGMv9R9tcgDfQCmuhIx4V7rhZBoiT8QZtSTqWhNmsZXVNQJgYRqF8?=
 =?us-ascii?Q?XRZJiNo5IrVSSkXI22SAupYGWcRaQLDbh1Vc5ejiqs2MvBJq0BJpQr4qRouv?=
 =?us-ascii?Q?N9l9OU/wqTDaHBHaIxEwH+//cuANSUqaVbUgA5NUJp+rFde+ovC60bsO7fAl?=
 =?us-ascii?Q?BV2LTBmy8DA3y7LwwMltoARmMacOPizX69YlPdZJjRQa9LmMD+aogble/of1?=
 =?us-ascii?Q?S/Pl9GX63lRPQ7GL2TBLsecGKRdSZBoTSIo5Spyr+vWKDNrteqgaADzCKDW5?=
 =?us-ascii?Q?BEngnQVAA/gTYRO29kswOo+YAjrVni2vh43L0y8YCZraappSAUmwMdveoMdp?=
 =?us-ascii?Q?td3o+533SKCj3uAw4G8+8ddwwYbEHmoNVTiLo7RNwP/VKvC8t3J5XTJk1Mt9?=
 =?us-ascii?Q?OyevEiniMpvnuPXcNCiix8HA5lDR/z1GOGr025mOBuKzf43MK8wc5xgsH3kl?=
 =?us-ascii?Q?7z8+ZdZqYweuS4K49h2feYyzn8SyGSCqcNjofxRHFT1SS1MI36PrjmQrHfB2?=
 =?us-ascii?Q?+pVN7z4b/7+464DONsey2B1EO8jnU+tLZZ4WMWTN8OvbRiRfcQgM+wPNaw1+?=
 =?us-ascii?Q?UQmfcr2f+5V+2vo3HonENAtmOfJONz5+4HX4WoNULTPqTH/pMZZixu9GLJHe?=
 =?us-ascii?Q?ToyJU0G5C4nzRcj/N5bBq8PPE/HsyFJJmVQZe46bU5Hg5EUj+csHNueYtOfV?=
 =?us-ascii?Q?YZZt15f+tsCuKnexU2s/g9DpWprmh1aWUjwFGLbYBa7c8pzptJx7E7tnC5Q6?=
 =?us-ascii?Q?SzzCVJSQ9TTUVSHy1uK4V11BR5kRB02RlPQvGYPn0ZEfrOPrcMr3whvleyeF?=
 =?us-ascii?Q?LOcxHb8+AZk7tHJV1rNCuG6osK2bz893k7W+BLVF7sparRQiWvXW98hMoTTT?=
 =?us-ascii?Q?Xj+GZY2pM9dKU4a3K0QuPaYqMqORY5WK5NWCsL865z7W/aKk7r14eRmbo3Eu?=
 =?us-ascii?Q?u3r1PJP8JWhZyU9X6OBNV72xYtgNqOLiB6hQt3yY2CiV0MtH486u1xHPO2qS?=
 =?us-ascii?Q?BTRUjRSefNU+JJKALYJyuWR4l+Jpzb1ZahK0OyM9r7aX0av7ErabY+D2P8rQ?=
 =?us-ascii?Q?PCrg0HRQnlkSCYmu0sdjQJ+JPTmnyjhFX7pxRZ2QArYDaCakK40jpFsT1TOY?=
 =?us-ascii?Q?6o8tt1AH9pIbXML2mRc2JHBOJLYf9skAWzh6PivFNbu1aYbGbfX+iJDqi+MK?=
 =?us-ascii?Q?h2BczBbNifeulmivQSBZaPGqm6jceD+XUqhWX33KRZct3FAp/vI74GZVO2aJ?=
 =?us-ascii?Q?pfQdihkmuQUXK42xOd63Nm1HPR7uBLdOHBfsoMY9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2e720a-6aa6-46cc-b17f-08db568b309a
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 04:00:02.3044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05tXIJ/CTyAhCzcvsq22mmvu0VtJao/2LiLwdmnctqfUrVs5vzkhzuWFPliFrnYcT7yf7AxRq00RnmlDJ0z8CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3988
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/17 10:44, Chao Yu wrote: > On 2023/5/16 20:07, Wu
 Bo wrote: >> Modify the order between 'trace_f2fs_iget' & 'unlock_new_inode', 
 so the >> I_NEW can pass to the trace event when the inode ini [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.122 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.122 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pz8Kg-00AW9U-HU
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: pass I_NEW flag to trace event
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: wubo.oduw@gmail.com, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 bo.wu@vivo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/17 10:44, Chao Yu wrote:
> On 2023/5/16 20:07, Wu Bo wrote:
>> Modify the order between 'trace_f2fs_iget' & 'unlock_new_inode', so the
>> I_NEW can pass to the trace event when the inode initialised.
>
> Why is it needed? And trace_f2fs_iget() won't print inode->i_state?

When connect a trace_probe to f2fs_iget, it will be able to determine whether
the inode is new initialised in order to do different process.

>
> Thanks,
>
>>
>> Signed-off-by: Wu Bo <bo.wu@vivo.com>
>> ---
>>   fs/f2fs/inode.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>> index cf4327ad106c..caf959289fe7 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -577,8 +577,8 @@ struct inode *f2fs_iget(struct super_block *sb,
>> unsigned long ino)
>>           file_dont_truncate(inode);
>>       }
>>   -    unlock_new_inode(inode);
>>       trace_f2fs_iget(inode);
>> +    unlock_new_inode(inode);
>>       return inode;
>>     bad_inode:
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
