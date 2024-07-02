Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8F4923D59
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 14:13:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOcNz-0001BP-BJ;
	Tue, 02 Jul 2024 12:13:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s_min.jeong@samsung.com>) id 1sOcNw-0001BJ-Fe
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 12:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fQw+IYHbL0xTtgej7CXwhTQ7qvGP/baI3QsyrH+7RPE=; b=cQEz6milyT3d5f7ODOVNrU1heF
 1M3w1vGs6UewgZAY0YmF3sB4mBpfzu67UqUVjU47iA/PD4eBfZPUZoKJJfPnRoNj8vxJIOTmeXFw9
 Al3gmng7F5XdL4uDpcImBpnrdJzEmvLXERrQdx3IqTLLH5F4PRAURfLxj3QOZuT6wulk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fQw+IYHbL0xTtgej7CXwhTQ7qvGP/baI3QsyrH+7RPE=; b=L5OYYLy2F8A/lyhC6hbqKiSOKz
 tpQ2z+LHdTrvJ1I2wc35Y9IwDPa6W0PW2cxcOIWF4h7NKAUwGaIJ/LE1YPWzcaBNG5OYIJ+geLWK2
 Wu6aYIiA2VZRxCbD14yG4Ulj0eGm6y/SiE+Mb9AHBFP1PMbRKo61JuZ3T/sAydRw/sMM=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOcNv-0000WV-3g for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 12:13:23 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240702121310epoutp010ad3941db87ef9f35eda4a17b9ea409e~eZE0toI0e1160311603epoutp01G
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Jul 2024 12:13:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240702121310epoutp010ad3941db87ef9f35eda4a17b9ea409e~eZE0toI0e1160311603epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1719922390;
 bh=fQw+IYHbL0xTtgej7CXwhTQ7qvGP/baI3QsyrH+7RPE=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=J2uZgE6/+ibHiAAMHLHsO1YHi8aUi6QwaZiPB+ZAC5MnaeZbRmOPk8M5JipCeAWTt
 4SDGQid2uV/SuAhSH5BUl9SJE/PKmMewX5+pMatKXaXvN07qavXmVN7fmrw6hy0pXY
 UfUeUC4I/AZHxNMh1wEZWy6akn/h1Hk5a8dUTcb0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240702121310epcas1p1339fc12ca924c194b7ddf2c4bd6c6b2d~eZE0h5cTW3046030460epcas1p1-;
 Tue,  2 Jul 2024 12:13:10 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.247]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4WD1yY5Qpsz4x9Pt; Tue,  2 Jul
 2024 12:13:09 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 16.68.09910.5DEE3866; Tue,  2 Jul 2024 21:13:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240702121309epcas1p1aa6092515863dec08bd7fe82e67db7f9~eZEzx9fMj1468214682epcas1p1u;
 Tue,  2 Jul 2024 12:13:09 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240702121309epsmtrp2dec70dfcfc1ab1453dde493aecca43e8~eZEzxXruB1337413374epsmtrp2Z;
 Tue,  2 Jul 2024 12:13:09 +0000 (GMT)
X-AuditID: b6c32a38-a3fff700000226b6-b7-6683eed58a89
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 5D.6D.18846.5DEE3866; Tue,  2 Jul 2024 21:13:09 +0900 (KST)
Received: from sminjeong05 (unknown [10.253.99.183]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20240702121309epsmtip245756f2f05328ac93ac9bac5ad2eef45~eZEzocFCu3163931639epsmtip2z;
 Tue,  2 Jul 2024 12:13:09 +0000 (GMT)
From: "Sunmin Jeong" <s_min.jeong@samsung.com>
To: "'Chao Yu'" <chao@kernel.org>, <jaegeuk@kernel.org>
In-Reply-To: <20240625031351.3586955-4-chao@kernel.org>
Date: Tue, 2 Jul 2024 21:13:09 +0900
Message-ID: <5f6701dacc79$33afa870$9b0ef950$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJIkRSe0PNvFivjVhHqD787u2nN5QGFMc2+AfNnngSw7ArncA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLKsWRmVeSWpSXmKPExsWy7bCmge7Vd81pBsfualicnnqWyeLJ+lnM
 FpcWuVtc3jWHzYHFY9OqTjaP3Qs+M3l83iQXwByVbZORmpiSWqSQmpecn5KZl26r5B0c7xxv
 amZgqGtoaWGupJCXmJtqq+TiE6DrlpkDtExJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquU
 WpCSU2BWoFecmFtcmpeul5daYmVoYGBkClSYkJ2xZOkR9oIe+YpXN/4wNjA+lehi5OSQEDCR
 WLplG0sXIxeHkMAORoml9+cxQTifGCUO3F7PAlIF5hzd4wfT8aG9mRkivpNR4tVXA4iGl4wS
 h15cBWtgE9CTmL76H1iRiIC5xJ7Fr9hAbGYBH4nft+6BxTmB4o8PfmEHsYUFQiTOvz8M1ssi
 oCKx89xVRhCbV8BS4uuT51C2oMTJmU9YIObIS2x/O4cZ4iAFiZ9Pl7FC7HKS+HPpNSNEjYjE
 7M42ZpDjJAReskus+vGTFaLBReJX6152CFtY4tXxLVC2lMTnd3vZIOxiiaPzN7BDNDcwStz4
 ehOqyF6iubUZqIgDaIOmxPpd+hDL+CTefe1hBQlLCPBKdLQJQVSrSnQ/WgJ1p7TEsmMHoaZ4
 SGz985R1AqPiLCSvzULy2iwkL8xCWLaAkWUVo1hqQXFuemqxYYEJPLKT83M3MYLToZbFDsa5
 bz/oHWJk4mA8xCjBwawkwhv4qz5NiDclsbIqtSg/vqg0J7X4EKMpMLAnMkuJJucDE3JeSbyh
 iaWBiZmRiYWxpbGZkjjvmStlqUIC6YklqdmpqQWpRTB9TBycUg1MnDZLa4WlLu7fG3m0Tv9s
 uuK8zfVr3kQfVecKkq+SXzTr38Nc2TfbnQ/Lt4R/53T6cFBUWdrT4O5U3e9d1i3PLU20Ys/w
 C86fG/jz1J87E913TSza4L2PN1e9TXAZT2PX7m6RQ87e9SkCBm2L7t9b1NDg9KLqZlnHj4ti
 S72UIqJLJPRvb7S7e3H+h5veT28dzdn17LnW9FffHqYL1awydeT5XPNfIyH1zuM0H8VXcnXe
 WT5mmhfXlp4LVzmsePvS4Zl51o7uhV6/X19zXsxdIfpuomLQ1m1VUyOCXmZ/Kfvncnkhp1Z8
 7BtPkYz8fft4ws3bOpuqfbaIJiVeFH7AtPP4feWYJ6wxTV2inluUWIozEg21mIuKEwHUGRUD
 EAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWy7bCSvO7Vd81pBmeXCFicnnqWyeLJ+lnM
 FpcWuVtc3jWHzYHFY9OqTjaP3Qs+M3l83iQXwBzFZZOSmpNZllqkb5fAlbFk6RH2gh75ilc3
 /jA2MD6V6GLk5JAQMJH40N7MDGILCWxnlLjX6NPFyAEUl5Y49qcIwhSWOHy4GKLiOaPE3FZr
 EJtNQE9i+up/YJ0iApYSC2adYwGxmQX8JHY9XAEU5wKq38wo8f1AGztIglPAXOLxwS9gtrBA
 kETP/MOsIDaLgIrEznNXGUFsXqBBX588h7IFJU7OfMICcgMz0LK2jYwQ8+Ultr+dwwxxvYLE
 z6fLWCFucJL4c+k1VI2IxOzONuYJjMKzkEyahTBpFpJJs5B0LGBkWcUomlpQnJuem1xgqFec
 mFtcmpeul5yfu4kRHAlaQTsYl63/q3eIkYmD8RCjBAezkghv4K/6NCHelMTKqtSi/Pii0pzU
 4kOM0hwsSuK8yjmdKUIC6YklqdmpqQWpRTBZJg5OqQamPfx5yo1sF0y3HnFWrV62c+mDlR+n
 brzpqOqw5vKdf58YBaWTiw413Uo7cJpjRtJux513DjxdLRIje0bj4KfFl4vWhZx89PbO9+y7
 XLYzd5zK3BZkxdh/U6TmHZ9T6Pz0O65HBR//Euwxr73xRP7Q5hOHTtqbFm3dYb07LP5RbIb/
 zP0bm+62eX0IkerfwKeZyiuwy3jDvfPc4d/ztbU2n8s798k/gZ07NVlQ1oudz/+49P3vUw46
 R358N8O6Y6Gw3oRJXzqf6z+qfbE+j9lLV3Tyc6tt66caFWqbbXg1d+v7RTU/e5a//SoddCPk
 9hbJm5IFzowK5r//TZ35RmWNnYbn1Ih3VVuOPbkwfe/6qDNKLMUZiYZazEXFiQBDpme38wIA
 AA==
X-CMS-MailID: 20240702121309epcas1p1aa6092515863dec08bd7fe82e67db7f9
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240625031523epcas1p12bf3d3dbe617eb6b8c00e742cf43ae50
References: <20240625031351.3586955-1-chao@kernel.org>
 <CGME20240625031523epcas1p12bf3d3dbe617eb6b8c00e742cf43ae50@epcas1p1.samsung.com>
 <20240625031351.3586955-4-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello I also have been thinking about the GC of the atomic
 file these days. I read your patches for atomic write, but I think there
 are some corner cases that can't be resolved with them. First is when the
 GC of the atomic file occurs right after the writeback of newly updated page.
 Since the atomic page flag is cleared at the end of f2fs_do_write_data_page,
 the GC thread will set the [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sOcNv-0000WV-3g
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs: atomic: fix to forbid dio in
 atomic_file
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello

I also have been thinking about the GC of the atomic file these days. I
read your patches for atomic write, but I think there are some corner
cases that can't be resolved with them.

First is when the GC of the atomic file occurs right after the writeback
of newly updated page. Since the atomic page flag is cleared at the end
of f2fs_do_write_data_page, the GC thread will set the page dirty and
let it be written to the atomic file, which will cause the data
corruption of the original inode.

Second is the foreground GC of atomic file. Although your patch can
distinguish whether pages should be written to the original inode or cow
inode, it can't handle the case when the atomic page needs to be
migrated but updated page already exists in the page cache as below.

// atomic file's 1st old block is a and new block is b.
// b is in the page cache
GC thread(FG_GC)
  - select A as a victim segment
  do_garbage_collect
    - iget atomic file's inode for block a
    move_data_page
      f2fs_do_write_data_page
        - use dn of cow inode since b has atomic flag
    - seg_freed is 0 since block a is still valid
    - goto gc_more and A is selected as victim again

Third is a race condition between GC of cow file and writeback thread of
atomic file. Since there are two page caches for one dnode, I think we
need to consider the race condition between them such as the case
between the file inode and the meta inode.

I submitted a patch set for atomic write, so could you review it?
The patch links are as below.
https://sourceforge.net/p/linux-f2fs/mailman/message/58790988/
https://sourceforge.net/p/linux-f2fs/mailman/message/58790989/

Thanks



> atomic write can only be used via buffered IO, let's fail direct IO on
> atomic_file and return -EOPNOTSUPP.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/file.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c index
> 0355cb054521..a527de1e7a2f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2150,6 +2150,7 @@ static int f2fs_ioc_start_atomic_write(struct file
> *filp, bool truncate)
>  		goto out;
> 
>  	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
> +	f2fs_down_write(&fi->i_gc_rwsem[READ]);
> 
>  	/*
>  	 * Should wait end_io to count F2FS_WB_CP_DATA correctly by @@ -
> 2209,6 +2210,7 @@ static int f2fs_ioc_start_atomic_write(struct file
*filp,
> bool truncate)
>  	}
>  	f2fs_i_size_write(fi->cow_inode, isize);
> 
> +	f2fs_up_write(&fi->i_gc_rwsem[READ]);
>  	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> 
>  	f2fs_update_time(sbi, REQ_TIME);
> @@ -4537,6 +4539,13 @@ static ssize_t f2fs_dio_read_iter(struct kiocb
> *iocb, struct iov_iter *to)
>  		f2fs_down_read(&fi->i_gc_rwsem[READ]);
>  	}
> 
> +	/* dio is not compatible w/ atomic file */
> +	if (f2fs_is_atomic_file(inode)) {
> +		f2fs_up_read(&fi->i_gc_rwsem[READ]);
> +		ret = -EOPNOTSUPP;
> +		goto out;
> +	}
> +
>  	/*
>  	 * We have to use __iomap_dio_rw() and iomap_dio_complete() instead
> of
>  	 * the higher-level function iomap_dio_rw() in order to ensure that
> the @@ -4948,6 +4957,12 @@ static ssize_t f2fs_file_write_iter(struct
> kiocb *iocb, struct iov_iter *from)
>  	/* Determine whether we will do a direct write or a buffered write.
> */
>  	dio = f2fs_should_use_dio(inode, iocb, from);
> 
> +	/* dio is not compatible w/ atomic write */
> +	if (dio && f2fs_is_atomic_file(inode)) {
> +		ret = -EOPNOTSUPP;
> +		goto out_unlock;
> +	}
> +
>  	/* Possibly preallocate the blocks for the write. */
>  	target_size = iocb->ki_pos + iov_iter_count(from);
>  	preallocated = f2fs_preallocate_blocks(iocb, from, dio);
> --
> 2.40.1
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
