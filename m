Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 083B5A4B599
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 01:18:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1totVI-0003sP-SD;
	Mon, 03 Mar 2025 00:17:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1totVI-0003sJ-0w
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 00:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:To:Subject:
 From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qzXgsvvVGV5i0DC+uMqLAlLy9jtXPt3OOl3JbyFacB4=; b=DYWyzvFan3STxQY4bzFLz4ed0c
 +uERPwS+7Y3dZT2TMtGxupvmCsMO42BAfwdycypvYQlkjpTpNW746dB04sL2JM+j5TsIOFKH4pj6G
 Y+wmOAUFWnP/8m8Qs0pwbKxXyhuiMBBI9GX2OLoavpWtscA13Aoo0m1uaKdFgCHwGEDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:To:Subject:From:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qzXgsvvVGV5i0DC+uMqLAlLy9jtXPt3OOl3JbyFacB4=; b=M
 XN0UsqEanbHQgcGNs99JJt5a5j9yXsI2CbDxjnM4sETsy/u7yMckmlW0veWQey0UG06S4dJFuMVCy
 rSq8xZLGmoLbyi1DRJ0aM+QofMfqMPVqu7Iraags9QyCWzt9bX+MAqrRuQrC4oWYe2EB43qoKSAMM
 HdCiYQP4UX/R3jzg=;
Received: from mout.gmx.net ([212.227.17.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1totV6-0007PE-BP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 00:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1740961053; x=1741565853; i=quwenruo.btrfs@gmx.com;
 bh=qzXgsvvVGV5i0DC+uMqLAlLy9jtXPt3OOl3JbyFacB4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
 Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=sEzv502Sc1Ihj0I1TFh1MpPb2Fa8Nsbfc3/2bZnWPqh1sgIWXMIVCcTfPxgMJk1E
 vxmEJ83cDbYdWvzKpR1oAl4MyJNb84RQGgzFlOyVmBuU0YUzryzq7J1Py5byYYr43
 4afigcEcFCdjjbGK+2LVq6S6clHYO6tvYvtoQEuQP3wMqZmkJlohuZfwtS1B6D8Tr
 ZJf50xDxKLxW3+DcJgoVjwkzYXghv8IV6tEnPxj+DDwK89uYHDO6QJMJpZBVz5pb1
 fKicmxMcKHGbNhbR4+DfpY5Ts8k597STwC9O1YLudzUh1o2FeQIyGpgLL/KupVJe+
 I6u4byYQKywWxTnKMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.191] ([159.196.52.54]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1ML9uU-1tXlss3fJS-00JtsX; Mon, 03
 Mar 2025 01:04:29 +0100
Message-ID: <14bd34c8-8fe0-4440-8dfd-e71223303edc@gmx.com>
Date: Mon, 3 Mar 2025 10:34:26 +1030
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linux Memory Management List <linux-mm@kvack.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Language: en-US
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
X-Provags-ID: V03:K1:F84/npxwE9CFBbiwq8yALJMx94BxGK+jZzvjIXfcblM7k8KTUNq
 Bs3JyPnWyS5xCAub2UFqyX+rh7wA46t1fJQXPgpfIv9FCVqwV0wKHN7/aHVDs59gz9/ySM/
 k1dcjJlaQit+Erl/CBWDBZgcUWkwcfkJASqU5SMElNKFgltaF8em+RPoc9NIIxsXsS5nwDW
 k26mpypuIzIbfcnFLZN9Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tfI87cVbN/U=;8rc1jzQA2FtI+c9TykXjRVSjVxo
 iS3Q3X6habTa/hw3UntQiWnasG977op3YxNWpKFi9wLMZ0XRwwAtHDELxHofeBtpuU0D34cwL
 Diepdtz8xapYYCIf6B1FrHJHv/L3i0eVA+mTmNK02LuJLfP4Eh2BJBJEk8hTCfBrXRsnhUw3f
 pDcgY0wWVlSZDAyWQCRFNTu13yCDBUBNktMIVT78HmEJLqFEMEMVv+kiJ70pBwEsTnIKGIWww
 ySWkyegYxsPtdF5XcTZKv5lJk+H2IRK3ufW6gTobGNyqIVmwDq63ShaMPdkRHKWXcWcLs8pf/
 JGcXYbKv7HEzO2YiPrJ9O0Bzh8iCaLojHzJESLBDrD2hOFAh2xzRNRab+P7hpquD1xrm2LR7R
 NOH3xPvi4Wq2PcbiBmg6fT9mnXv8dV8aF09u51hskPdxmmo1Zlasx1mzJSM8qUr8k/WtXmKHI
 6zu3IuLjLzwsn44ID8r/IxbkG5h0DZI680og7tDzrXCol6IJsTdAm49VoujYRcAYch9u4H99T
 ODgfVs8AVAwNeupjJtHRIF6W3TR7M2jGHaK0VMht35HXwtLhAoLKJVRA9PkLCiJeUSpnzmpNZ
 LxOYVD7hBpXbyGSJBpp0gStxIrZ88RgBfwy7M7Ki+sH8stm8CBPTbugh8ghtbk3GXo3SVBl14
 5Uc4leeklmTn40vyEGrdYnpX1mZARV70XZC5ad3u/7xnOFkuOYV3OSZz3GFJJx6oQPFDEX0PI
 Wb8Bw/fsbgUHAQKtRRHryQRAnVnr7TSMGVquAnJJ4rPiqJnUnFM9A0Omb91DYBN3Dx0lp7W5r
 C87ygBmD/iU0rjpZypW0XqMMlgb5fkGMi7i6Jt8LenFB9VLSXi65O4fhTbwDowFspdMyWCZIb
 1yKukj/5TykSwY9h3+5qUU8J2Yl9bcT16AiTmbGP+2LbkaQDb4uK3PZHbAuu7TDMO/MnuUlkb
 BRgOQngxqsAaYz7UNNpZ7BWUK2swoPKjTWbNk8IhksUngNsAEKa7JavilvSmg2+A4h7uxdvJ/
 OXD6FBg2E2EYd6QyFA8q/nfCj4QM6CHPHFvq3LrzuX+UR5ijf8LzrKHjSsjt6N1p25Fu7N+H8
 UvVA00kVOP21g1x0UYDY2W2kaC9R3ICr+fA4vm0+8E1LqVQJHLLgGapAzoyFuRy6cdgbblwI3
 9REuepCjIP9UXZ7LLwFveCzYKt8UYV+BHJ/hxV2w6/RXH0i/ofFIAKN3ZkwGGnnNdbqgHkeIy
 kXH9ISD86g5IJZT+YuDIn7ybh5SbtgtRcJTYcXjQyEIo8yY3rgrjtqJyoAPEQUB/vuzLV7oke
 PPah+57dw4kpSO2oVFlggFIlEUUhPt+QRSUzJeX44zSBin5EykZo440jecJDSjKFrce1FqOez
 y7LXBzDUhGCwtmjUDlw6kht+AfXje6nJjynrKOtFHBxPaIIQw94fvo84XK
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi,
 [SPINLOCK AND END WRITEBACK] Although folio_end_writeback()
 can be called in an interruption context (by the in_task() check), surprisingly
 it may not be suitable to be called inside a spinlock (in task context): 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [212.227.17.21 listed in sa-trusted.bondedsender.org]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [212.227.17.21 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [212.227.17.21 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [212.227.17.21 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [quwenruo.btrfs[at]gmx.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1totV6-0007PE-BP
Subject: [f2fs-dev] Calling folio_end_writeback() inside a spinlock under
 task context?
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
From: Qu Wenruo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

[SPINLOCK AND END WRITEBACK]

Although folio_end_writeback() can be called in an interruption context
(by the in_task() check), surprisingly it may not be suitable to be
called inside a spinlock (in task context):

For example the following call chain can lead to sleep:

spin_lock()
folio_end_writeback()
|- folio_end_dropbehind_write()
    |- folio_launder()
       Which can sleep.

My question is, can and should we allow folio_end_writeback() inside a
spinlock?

[BTRFS' ASYNC EXTENT PROBLEM]

This is again a btrfs specific behavior, that we have to call
folio_end_writeback() inside a spinlock to make sure really only one
thread can clear the writeback flag of a folio.

I know iomap is doing a pretty good job preventing early finished
writeback to clear the folio writeback flag, meanwhile we're still
submitting other blocks inside the folio.

Iomap goes holding one extra writeback count before starting marking
blocks writeback and submitting them.
And after all blocks are submitted, reduce the writeback count (and call
folio_end_writeback() if it's the last one holding the writeback flag).

But the iomap solution requires that, all blocks inside a folio to be
submitted at the same time.

This is not true in btrfs, due to the design of btrfs' async extent,
which can mark the blocks for writeback really at any timing, as we keep
the lock of folios and queue them into a workqueue to do compression,
then only after the compression is done, we submit and mark them
writeback and unlock.

If we do not hold a spinlock calling folio_end_writeback(), but only
checks if we're the last holder and call folio_end_writeback() out of
the spinlock, we can hit the following race where folio_end_writeback()
can be called on the same folio:

      0          32K         64K
      |<- AE 1 ->|<- AE 2 ->|

             Thread A (AE 1)           |            Thread B (AE 2)
--------------------------------------+------------------------------
submit_one_async_extent()             |
|- process_one_folio()                |
      |- subpage_set_writeback()       |
                                       |
/* IO finished */                     |
end_compressed_writeback()            |
|- btrfs_folio_clear_writeback()      |
      |- spin_lock()                   |
      |  /* this is the last writeback |
      |     holder, should end the     |
      |     folio writeback flag */    |
      |- last = true                   |
      |- spin_unlock()                 |
      |                                | submit_one_async_extent()
      |                                | |- process_one_folio()
      |                                |    |- subpage_set_writeback()
      |                                |
      |                                | /* IO finished */
      |                                | end_compressed_writeback()
      |                                | |btrfs_folio_clear_writeback()
      |                                |    | /* Again the last holder */
      |                                |    |- spin_lock()
      |                                |    |- last = true
      |                                |    |- spin_unlock()
      |- folio_end_writeback()         |    |- folio_end_writeback()

I know the most proper solution would to get rid of the delayed unlock
and submission, but mark blocks for writeback without the async extent
mechanism completely, then follow the iomap's solution.

But that will be a huge change (although we will go that path
eventually), meanwhile the folio_end_writeback() inside spinlock needs
to be fixed asap.

So my question is, can we allow folio_end_writeback() to be called
inside a spinlock, at the cost of screwing up the folio reclaim for
DONTCACHE?

Thanks,
Qu


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
