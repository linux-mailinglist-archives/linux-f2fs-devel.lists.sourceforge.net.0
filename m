Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E309586338
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Aug 2022 06:07:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oIMhs-0003S4-TA; Mon, 01 Aug 2022 04:07:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <eunhee83.rho@samsung.com>) id 1oIMhr-0003Ry-6R
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 04:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1xmuozlUVstGB2fJ4rqWFjLc1ucMPbO4tmMpICPDtFM=; b=WVOHcK7iHX+0kJuzvPUwBT/IEJ
 eIJCv+dvoFs37RpI7DpEx+3TC+Flh3+KVGuNRiH4jo7XXBGxd3gSl1NEsjFmLIR9byC8qDEbxM1Sq
 o96Ct/F/f8/bwQkrMQxZIs15pigI01Y8VPp1qSMKxllp/hHxJ59enAwewMyCiO9TTiXw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1xmuozlUVstGB2fJ4rqWFjLc1ucMPbO4tmMpICPDtFM=; b=aEtSKRWVCiW0y7cTcU9tCtRh5f
 iwhEyrChXa9YpB2TvZJrBGB11ABvuvJfFmNorqQ0M5dj0Okfz78HIPdU+3hNX19tq/gMttqvlnR/c
 G0cn3UgE5TsU10kZpbmBlBYW5I4OG99nJ12/3t/aXofnOmnpcNX0zswBi/kQ766smxr4=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oIMh8-0000qX-R7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 04:06:45 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20220801040608epoutp01b66649cb7bf4717c5aac8286b845697f~HHOeeVLeF2660826608epoutp01I
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Aug 2022 04:06:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20220801040608epoutp01b66649cb7bf4717c5aac8286b845697f~HHOeeVLeF2660826608epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1659326768;
 bh=1xmuozlUVstGB2fJ4rqWFjLc1ucMPbO4tmMpICPDtFM=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=lk43Fg4bO8+ZMbydy0jo9fqQ1H2C7hboxsDjtuItDTweZBfSZvmWCcsGhXC/6pRo9
 PMZlgfXIhCwhy1GYu6dbH/mjHfGR11rCe4j0x32GVXG1zBjwflbPgI828LHwdSrSiB
 gmiWxZAgHfm8cqJw6iY2JOsuszIEEzWGtZYEI1uM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20220801040608epcas2p196a71867d2ed4b4adbedbdd675b02a68~HHOeED2gl2566225662epcas2p1J;
 Mon,  1 Aug 2022 04:06:08 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.91]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Lx4L80Hs3z4x9Pq; Mon,  1 Aug
 2022 04:06:08 +0000 (GMT)
X-AuditID: b6c32a48-9f7ff700000025be-f2-62e7512f8858
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 B4.4D.09662.F2157E26; Mon,  1 Aug 2022 13:06:07 +0900 (KST)
Mime-Version: 1.0
From: Eunhee Rho <eunhee83.rho@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <YuXZSTw4reBDtLgk@google.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20220801040607epcms2p82da0594039ba5f1ed77c451e2d13c965@epcms2p8>
Date: Mon, 01 Aug 2022 13:06:07 +0900
X-CMS-MailID: 20220801040607epcms2p82da0594039ba5f1ed77c451e2d13c965
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7bCmqa5+4PMkg6avNhanp55lsnh5SNPi
 55MONosn62cxW1xa5G5xedccNgc2j02rOtk8di/4zOTRt2UVo8fnTXIBLFHZNhmpiSmpRQqp
 ecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAq5UUyhJzSoFCAYnFxUr6
 djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2RkTj+9jKmjkrPh0
 hbuBcQZ7FyMnh4SAiUT702lANheHkMAORol9TVOYuhg5OHgFBCX+7hAGqREWcJHYt+Y3C4gt
 JKAk8ffgfSaIuK7ElC2TGEFsNgFtiSvH21lBbBEBFYlDiy6DzWQW2M8ocadnBxPEMl6JGe1P
 WSBsaYnty7eCNXMKaElM+vEWKq4h8WNZLzOELSpxc/Vbdhj7/bH5jBC2iETrvbNQNYISD37u
 hopLSNzd2MIGYedL9Dw5CrW3QmLniqtQNfoS1zo2gu3iFfCVOLb0FVg9i4CqxIkpLVA3uEgc
 urEIbD6zgLzE9rdzmEFhwiygKbF+lz6IKSGgLHHkFgvMVw0bf7Ojs5kF+CQ6Dv+Fi++Y9wTq
 GjWJxR8XsE5gVJ6FCOhZSHbNQti1gJF5FaNYakFxbnpqsVGBCTxqk/NzNzGC06CWxw7G2W8/
 6B1iZOJgPMQowcGsJMJ7x+V5khBvSmJlVWpRfnxRaU5q8SFGU6AvJzJLiSbnAxNxXkm8oYml
 gYmZmaG5kamBuZI4r1fKhkQhgfTEktTs1NSC1CKYPiYOTqkGJsMT8ed1bjvwS09Y/PT81qzd
 121cug42CCWcfy/kdZ/LbnJQOee5C7GhvlP3p7z3snzF+/GdnaIjw4U13ROqU0OZxb0rT1+2
 VFXZN/9964dT8Z+4jh7NEzy49oPW1ur373RmFs262Ka4/3N99/6Hto0Pr7M/3qnt6PFKilmc
 bcH9Xe0C3mwT17UpHDi72mvN/2PBGwt/fb/z4m9+rorJA+cpxa5XLrxhPX7S9npUIaOTxlHr
 1VIyr/ak/rnBY932yvDzrPtTQ/e35rfe5OE4b7lQoXp6QXFR2OcrAd/dMnZOnFb371kVs1Z2
 Revmcxb3PxT6v+h7zZWf71bqbXOQYa2EkPCC0rKvG38Yr1G8s0qJpTgj0VCLuag4EQAwmuff
 DAQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220729002517epcms2p35eed262c3349287436c1848ab350c2d4
References: <YuXZSTw4reBDtLgk@google.com>
 <20220729002517epcms2p35eed262c3349287436c1848ab350c2d4@epcms2p3>
 <CGME20220729002517epcms2p35eed262c3349287436c1848ab350c2d4@epcms2p8>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 07/29, Eunhee Rho wrote: >> For zoned devices,
 f2fs forbids
 direct IO and forces buffered IO >> to serialize write IOs. However, the
 constraint does not apply to >> read IOs. >> >> Signed-off-by: [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oIMh8-0000qX-R7
Subject: Re: [f2fs-dev] [PATCH v0] f2fs: allow direct read for zoned device
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
Reply-To: eunhee83.rho@samsung.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>On 07/29, Eunhee Rho wrote:
>> For zoned devices, f2fs forbids direct IO and forces buffered IO
>> to serialize write IOs. However, the constraint does not apply to
>> read IOs.
>> 
>> Signed-off-by: Eunhee Rho <eunhee83.rho@samsung.com>
>> ---
>>  fs/f2fs/f2fs.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index d0f428aef34b..f69731f17402 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4471,7 +4471,7 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
>>  	 * for blkzoned device, fallback direct IO to buffered IO, so
>>  	 * all IOs can be serialized by log-structured write.
>>  	 */
>> -	if (f2fs_sb_has_blkzoned(sbi))
>> +	if (f2fs_sb_has_blkzoned(sbi) && (rw == WRITE))
>>  		return true;
>
>Actually we don't need to check the device type, but rely on the
>filesystem allocation policy like the below lfs mode. Can we remove this
>line simply?
>
>>  	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
>>  		if (block_unaligned_IO(inode, iocb, iter))
>> -- 
>> 2.25.1
>

Yes, I will reflect on the next patch.
Thanks. 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
