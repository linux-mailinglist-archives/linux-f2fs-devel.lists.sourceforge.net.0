Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B10CB698A47
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Feb 2023 03:02:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSTbV-00052b-5r;
	Thu, 16 Feb 2023 02:02:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1pSTbT-00052U-Oc
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 02:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CSvqJjBL22C0lmgcM8zgoa8hVL77LICcIrvup4e0B1o=; b=dBBT82hF+ikT4+QTd2KTIs6hOd
 bpeBW8sU2pMVvgwVMUjOr1NbgujeTcXtdyLQtZ0VHssY7zhZKM0E4dYmlK0xPZdlLaMMkmUkZ/CMG
 Wjwevnm9k2iT3jwU4FcM2II8tCNqbaB0mYXQwrMnOZ0Etg16Cr470YMORI6F/NXQ0A9Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CSvqJjBL22C0lmgcM8zgoa8hVL77LICcIrvup4e0B1o=; b=OFX1CP8WbiR/gVBMHIUliYgkBj
 E6qjQ/mhyZOdXmFcQm20f1fMWv2njC1u1EBViSmQOJL688/tCJcy6PaXoz/+KVE+ZiP7s1KS2v3+k
 CuZJct1ENAzoqSBNSC6KyIGvA4e10lhLTjITn3nm7sCetfxcY1Xv+Z6J8JydXHDbnIiA=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSTbQ-0000TT-3L for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 02:02:31 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230216020215epoutp04dc122d3e2738d119801da8bd3911a2d2~EK6HrcVrP3076330763epoutp04G
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Feb 2023 02:02:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230216020215epoutp04dc122d3e2738d119801da8bd3911a2d2~EK6HrcVrP3076330763epoutp04G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1676512935;
 bh=CSvqJjBL22C0lmgcM8zgoa8hVL77LICcIrvup4e0B1o=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=W55n6i4JpuqgbnUZhBDpWGQFqt+m9ugcBULO6ETKSLboUI6RXW9bk/TZWRpsq4JE2
 Nr1Z6WPQrNHCwvY9jCcZC3YU4mbf/mo7PvvvJBoKEjnsg4+GEZLQB4JcqmWp5i4yxf
 kL8XfliaAVouEdRmOCshbS+MjgNptZS8B6sxgfEg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20230216020215epcas2p3be5de9975ecdc1198c5f7395f1a3bb8a~EK6HVWvAW3106531065epcas2p3x;
 Thu, 16 Feb 2023 02:02:15 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.91]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4PHJ9M0FH3z4x9Py; Thu, 16 Feb
 2023 02:02:15 +0000 (GMT)
X-AuditID: b6c32a45-671ff7000001f1e7-aa-63ed8ea624d5
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 62.B3.61927.6AE8DE36; Thu, 16 Feb 2023 11:02:14 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <cf7eae6b-61ea-accb-f981-023fb022919c@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230216020214epcms2p1dfa8562c1d33231856848bb0ec8ba1a7@epcms2p1>
Date: Thu, 16 Feb 2023 11:02:14 +0900
X-CMS-MailID: 20230216020214epcms2p1dfa8562c1d33231856848bb0ec8ba1a7
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFKsWRmVeSWpSXmKPExsWy7bCmme6yvrfJBisem1mcnnqWyWLVg3CL
 J+tnMVtcWuRucXnXHDaLVR1zGR3YPDat6mTz2L3gM5NH35ZVjB6fN8kFsERl22SkJqakFimk
 5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYArVZSKEvMKQUKBSQWFyvp
 29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGc8uL+evaCHs+LD
 qZPMDYwr2bsYOTkkBEwkmk6dZ+pi5OIQEtjBKLFozj62LkYODl4BQYm/O4RBaoQFnCW+TXrK
 DGILCShJXDvQywIR15fYvHgZ2Bw2AV2JvxuWs4PMERF4wCgx5cZeNpAEs0CQxP0pD1ghlvFK
 zGh/ygJhS0tsX76VEcTmFLCTuLT5NVRcQ+LHsl5mCFtU4ubqt+ww9vtj8xkhbBGJ1ntnoWoE
 JR783A0Vl5RYdAjkGRA7X+LviutsEHaNxNaGNqi4vsS1jo1gu3gFfCUOdRwAu41FQFXi++PT
 UDNdJA4cvM0Mcb+8xPa3c5hBYcIsoCmxfpc+iCkhoCxx5BYLRAWfRMfhv+wwH+6Y9wRqk5rE
 5k2boT6XkbjwuA3qSg+JSVvvMU9gVJyFCOhZSHbNQti1gJF5FaNYakFxbnpqsVGBITxuk/Nz
 NzGCE6GW6w7GyW8/6B1iZOJgPMQowcGsJMK76eabZCHelMTKqtSi/Pii0pzU4kOMpkBfTmSW
 Ek3OB6bivJJ4QxNLAxMzM0NzI1MDcyVxXmnbk8lCAumJJanZqakFqUUwfUwcnFINTOueGe2J
 26Vb9Oz2lB3ZubuOMcatf/9K8baonILLE5fXXTYl9h9CBScsVM5dZ7zzX/C9PakzHmgySn/1
 vdHmHMdzzvMQhynDzacR6nsba8Kva/9V/tdSMevs/4fursXSpbO8c1oDHrFcCPvhp66zTWfz
 sW57pfn5ZpZRHdF3vmguOrxBcOmxWJejW/z7C0+p9Mfm/W9oD9nAJx4i4BJ14sTl4rQzOxYV
 Huj68IBb/VL0Go78ZsfHXsfclyy8duDV7voCt7WmE5sZbPr7pS1aH7TcWmA3+8Vbtp/KNU5q
 uV6WzKXTZjg+KLguldj5cNH3xZJzXGqnRObNuaNZvqvpp+HX7kjJDNcdTWkhey88U2Ipzkg0
 1GIuKk4EAK8lt+ENBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6
References: <cf7eae6b-61ea-accb-f981-023fb022919c@kernel.org>
 <20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6@epcms2p2>
 <CGME20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6@epcms2p1>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/15 10:48, Yonggil Song wrote: >> When f2fs skipped
 a gc round during victim migration, there was a bug which >> would skip all
 upcoming gc rounds unconditionally because skipped_gc_rwsem >> [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pSTbQ-0000TT-3L
Subject: Re: [f2fs-dev] (2) [PATCH v1] f2fs: fix uninitialized
 skipped_gc_rwsem
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
Reply-To: yonggil.song@samsung.com
Cc: Seokhwan Kim <sukka.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/15 10:48, Yonggil Song wrote:
>> When f2fs skipped a gc round during victim migration, there was a bug which
>> would skip all upcoming gc rounds unconditionally because skipped_gc_rwsem
>> was not initialized. It fixes the bug by correctly initializing the
>> skipped_gc_rwsem inside the gc loop.
>
>It makes sense to me.
>
>> 
>> Fixes: d147ea4adb96 ("f2fs: introduce f2fs_gc_control to consolidate f2fs_gc parameters")
>
>How does this commits introduce the bug?

Oh, sorry I've got wrong hash.
I'll send right hash on PATCH v2.

Thanks for your comment.

>
>Thanks,
>
>> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
>> 
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index b22f49a6f128..81d326abaac1 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -1786,8 +1786,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>>   				prefree_segments(sbi));
>>   
>>   	cpc.reason = __get_cp_reason(sbi);
>> -	sbi->skipped_gc_rwsem = 0;
>>   gc_more:
>> +	sbi->skipped_gc_rwsem = 0;
>>   	if (unlikely(!(sbi->sb->s_flags & SB_ACTIVE))) {
>>   		ret = -EINVAL;
>>   		goto stop;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
