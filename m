Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AAF9BB012
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2024 10:44:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7tdH-0004fv-Uc;
	Mon, 04 Nov 2024 09:44:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinsu1.lee@samsung.com>) id 1t7tdG-0004fl-1I
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 09:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M1miNIYhG1QwHyjzF59FHi1H9PWcn1lSEkKONcArFuM=; b=N3adLG/06qY+u6U0BTM+FeVX/b
 wD6XXNOOg3hAQIu17fkWgTJ9Osr20LoDd0utRoLps2m3Jor3u36H+JdQR6nztGeg6XJThg9prmzhz
 sqT9UI5PuyuMsNCdFOJ6bnxn1U4Rm63LqodIrH+oNIf++tW2s1qOOmtUN3jL9Gk6iqn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=M1miNIYhG1QwHyjzF59FHi1H9PWcn1lSEkKONcArFuM=; b=I
 x80NF/Ru5UOTgsTCRfnu5yv8UEBhpH5wpTa5ComD3qHdBPMk/b5OA2c/KdQlKj1uvZ0aVCdsV+Cpj
 rq3VBDHN15wM2uy5zpA7Ac5/6Z6GAHMEMsadGRIIMOSXqTdQK7S2EGqA+lu6vt5+mydt1pvDpf0mZ
 Hi52h5JIkJ6mhQbM=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7tdF-0002vE-86 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 09:44:22 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20241104094413epoutp01ebdf92458c9704cf3c7a0097323374a1~Eurd3wTek3186231862epoutp01E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Nov 2024 09:44:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20241104094413epoutp01ebdf92458c9704cf3c7a0097323374a1~Eurd3wTek3186231862epoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1730713454;
 bh=M1miNIYhG1QwHyjzF59FHi1H9PWcn1lSEkKONcArFuM=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=IqugJYrULbVBD4BViH/D0rDpt6i01zWETZxKEuw06Yd0qHYV1wva0N6+723iEQIl5
 HQO7Ck+04yTd/48tUhevPFYnFi6y9AutoAN2vwyOvtZe/ijKD6k9dUa37EQB8I/KCZ
 Goi/niBEYBJrbkaBPZRFZ3tcTCSUgQ0qCN71mv8w=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20241104094413epcas2p49f76cf369e11007548f4389b88cc4f3d~EurddPD2G0277502775epcas2p4K;
 Mon,  4 Nov 2024 09:44:13 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.98]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Xhml06wgmz4x9Q1; Mon,  4 Nov
 2024 09:44:12 +0000 (GMT)
X-AuditID: b6c32a47-aefff70000002630-90-6728976c1761
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 F5.2E.09776.C6798276; Mon,  4 Nov 2024 18:44:12 +0900 (KST)
Mime-Version: 1.0
From: =?UTF-8?B?7J207KeE7IiY?= <jinsu1.lee@samsung.com>
To: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20241104094412epcms2p13f82502b0ff6167ff30eb76c6dda41de@epcms2p1>
Date: Mon, 04 Nov 2024 18:44:12 +0900
X-CMS-MailID: 20241104094412epcms2p13f82502b0ff6167ff30eb76c6dda41de
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKKsWRmVeSWpSXmKPExsWy7bCmuW7OdI10g7bzRhanp55lsniyfhaz
 xbWmiawWlxa5W1zeNYfNgdVj06pONo/dCz4zefRtWcXo8XmTXABLVLZNRmpiSmqRQmpecn5K
 Zl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtBaJYWyxJxSoFBAYnGxkr6dTVF+
 aUmqQkZ+cYmtUmpBSk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xvcbd9gKjklUzDv1gL2B
 catwFyMHh4SAiUTbW7MuRi4OIYEdjBKvZrWwgcR5BQQl/u4AKuHkEBYolDjxrJsFxBYSUJCY
 2rKJDSJuKXFx6T9WkHI2AXOJG73eIGERgXCJ+ct3sIOMZBY4xSjRuOsUK0hCQoBXYkb7UxYI
 W1pi+/KtjBC2hsSPZb3MELaoxM3Vb9lh7PfH5kPViEi03jsLVSMo8eDnbqi4pMTOloVQ8XyJ
 h+cfsYIslhBoYZQ4PWcKVJG+xLY/s8EW8wr4Smx72s4EYrMIqEqc2TEP6iAXiTXbesDizALy
 EtvfzmEGeYxZQFNi/S59SFApSxy5xQJRwSfRcfgvO8xbO+Y9YYKwVSRWz90HdY6UxJwVk6Au
 8JC4NvUeGyQIAyVeb7vHNoFRYRYioGch2TsLYe8CRuZVjGKpBcW56anFRgXG8KhNzs/dxAhO
 f1ruOxhnvP2gd4iRiYPxEKMEB7OSCO+8VPV0Id6UxMqq1KL8+KLSnNTiQ4ymQB9PZJYSTc4H
 JuC8knhDE0sDEzMzQ3MjUwNzJXHee61zU4QE0hNLUrNTUwtSi2D6mDg4pRqYls1h8f3AfIR7
 1yXxns3zjDQbLh6JvrNx+cwvf+7ebDwtGz67QS/02IyPazWcPjt36uq18nVbWCj8c2/XcUpU
 VOl9njn137Tfv4T1qxpkKhZN13+ly6Aaf/D+9mCuE2U/bP8s1dbfmcPR6HAtek6cuon0dmHN
 SVdfzDmY7WbI88f7uNiRbdNFfCNYQ4zV1169tuLjge//b1akCCvru8e/C6tZKRO6nO9SxSE+
 /eal6XMzv9f9mD8t1rbS/+TJxY/WbNSJFpzd8fHfCsY2lytBTXwyBYeSzSInNphN4VQPsFyX
 nHj000KF1IcfbTIFH+x76vekW8gpMl5CRyhy1h/R9pgrmyc/jE8oj4p4sXKbEktxRqKhFnNR
 cSIA4S5uuAgEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241104094412epcms2p13f82502b0ff6167ff30eb76c6dda41de
References: <CGME20241104094412epcms2p13f82502b0ff6167ff30eb76c6dda41de@epcms2p1>
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >>> Jinsu Lee reported a performance regression issue, after
 commit >> >>> 5c8764f8679e ("f2fs: fix to force buffered IO on inline_data
 >> >>> inode"), we forced direct write to use buffered IO on inl [...] 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7tdF-0002vE-86
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid forcing direct write to
 use buffered IO on inline_data inode
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
Reply-To: jinsu1.lee@samsung.com
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>>> Jinsu Lee reported a performance regression issue, after commit
>> 
>>> 5c8764f8679e ("f2fs: fix to force buffered IO on inline_data
>> 
>>> inode"), we forced direct write to use buffered IO on inline_data
>> 
>>> inode, it will cause performace regression due to memory copy
>> 
>>> and data flush.
>> 
>> 
>>> It's fine to not force direct write to use buffered IO, as it
>> 
>>> can convert inline inode before committing direct write IO.
>> 
>> 
>>>> Fixes: 5c8764f8679e ("f2fs: fix to force buffered IO on inline_data inode")
>> 
>>> Reported-by: Jinsu Lee <jinsu1.lee@samsung.com>
>> 
>>> Closes: https://lore.kernel.org/linux-f2fs-devel/af03dd2c-e361-4f80-b2fd-39440766cf6e@kernel.org
>> 
>>> Signed-off-by: Chao Yu <chao@kernel.org>
>> 
>>> ---
>> 
>>> fs/f2fs/file.c | 6 +++++-
>> 
>>> 1 file changed, 5 insertions(+), 1 deletion(-)
>> 
>> 
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> 
>>> index 0e7a0195eca8..377a10b81bf3 100644
>> 
>>> --- a/fs/f2fs/file.c
>> 
>>> +++ b/fs/f2fs/file.c
>> 
>>> @@ -883,7 +883,11 @@ static bool f2fs_force_buffered_io(struct inode *inode, int rw)
>> 
>>>                  return true;
>> 
>>>          if (f2fs_compressed_file(inode))
>> 
>>>                  return true;
>> 
>>> -        if (f2fs_has_inline_data(inode))
>> 
>>> +        /*
>> 
>>> +         * only force direct read to use buffered IO, for direct write,
>> 
>>> +         * it expects inline data conversion before committing IO.
>> 
>>> +         */
>> 
>>> +        if (f2fs_has_inline_data(inode) && rw == READ)
>> 
>> 
>> Chao Yu,
>> 
>> The fio direct performance problem I reported did not improve when reflecting this commit.
>> 
>> Rather, it has been improved when reflecting your commit below.
>> 
>> 
>> The previous commit seems to be mistitled as read and the following commit appears to be the final version.
>> 
>> The reason for the improvement with the commit below is that there is no "m_may_create" condition
>> 
>> when performing "io_submit" directly, so performance regression issue may occur.
>> 
>> 
>> I wonder if "rw == READ" should be additionally reflected.
>
> Alright, thanks for your feedback.
>
> I thought you have bisected this performance issue to commit
> 5c8764f8679e ("f2fs: fix to force buffered IO on inline_data inode"),
> so I sent this patch for comments.
>
> Can you please apply both below dio fixes, and help to check final
> performance?
>
> https://lore.kernel.org/linux-f2fs-devel/20241104015016.228963-1-chao@kernel.org
> https://lore.kernel.org/linux-f2fs-devel/20241104013551.218037-1-chao@kernel.org
>
> Thanks,

Chao Yu,
After reflecting the following two commits, the fio DIO seq write operates with normal performance.

https://lore.kernel.org/linux-f2fs-devel/20241104015016.228963-1-chao@kernel.org
https://lore.kernel.org/linux-f2fs-devel/20241104013551.218037-1-chao@kernel.org

However, Antutu Apk's "AI READ" performance has more than tripled compared to before patch reflection, so it seems necessary to check if there is any problem with DIO performance.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
