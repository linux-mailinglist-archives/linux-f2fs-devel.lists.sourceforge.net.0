Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A08046F9B6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Dec 2021 04:55:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvX0Y-0004Vj-Gt; Fri, 10 Dec 2021 03:55:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hj514.kim@samsung.com>) id 1mvX0X-0004Vd-Jr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 03:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uQc+WHgx9ICVHhrgOeloK7AJPiN+NoYERUsbxiOe+kc=; b=aJr4Xh1EFpfX7DkVSr6O6GKDvY
 9UM1OwedYcvvCQ0GpgyyhsdQWWY8svNjXECeJRCtd0uLHSktT4z60jhQl53BuSa7MnGixvuvUapLR
 8z36adhLRxsisOEG/lXE74vm1Vj8csZOb707lvctNHSYo2FNj/MIAxJETTjyfBFGiljs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uQc+WHgx9ICVHhrgOeloK7AJPiN+NoYERUsbxiOe+kc=; b=KZ9l90UWccsH9xEaCI7dJk9pWO
 YqCe4qvnDkQsbKI7nZJG0g//AUdnQihTAs9aRVAtOvfbpxZwGVkbHu5dmPf5SKuD8hW81gAJyEcyW
 Pup3DiLQoc9p+PP7K95iqNDODfYf8F02t2tsFHMKd3h1rQukFBWfq+lHq+VZeGoDIZhg=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mvX0U-00AiMv-Tm
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 03:55:42 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20211210033625epoutp0100d7f7edab283243e0fdaa5998792477~-R3uiT4f53244132441epoutp01j
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Dec 2021 03:36:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20211210033625epoutp0100d7f7edab283243e0fdaa5998792477~-R3uiT4f53244132441epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1639107385;
 bh=uQc+WHgx9ICVHhrgOeloK7AJPiN+NoYERUsbxiOe+kc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=NzgboHMS1bhoapN5fKbi4EY9fIdPByjAEVw8vm3VZZ04JHREYPVkvFb+IrPJ6mnV8
 uwjDZdvUs0N4wUUkRo5MV3fdAllaHvAZ718cTXqY23yTrZkFi9CqvX3Sbhr3r96ZoM
 oW7JMJ5ve09ELe+CDcM5MATACqLPsdLPs5vEPFbE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20211210033625epcas1p35f1da6f76b50d917bf0ba17b691f46d8~-R3uIGkxD0276502765epcas1p3V;
 Fri, 10 Dec 2021 03:36:25 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.243]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4J9Glr1HxVz4x9Q5; Fri, 10 Dec
 2021 03:36:24 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 B7.71.21932.0DAC2B16; Fri, 10 Dec 2021 12:34:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20211210033619epcas1p4f2d13fb3e20ff393abc6e4ed2e223bce~-R3pJh0D60257002570epcas1p4t;
 Fri, 10 Dec 2021 03:36:19 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211210033619epsmtrp1e5c2bcf366b385faf632e32e688e593e~-R3pI0x1m2415024150epsmtrp1K;
 Fri, 10 Dec 2021 03:36:19 +0000 (GMT)
X-AuditID: b6c32a38-93fff700000255ac-ac-61b2cad0e6b9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 79.F4.29871.23BC2B16; Fri, 10 Dec 2021 12:36:18 +0900 (KST)
Received: from hj514 (unknown [10.253.100.146]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20211210033619epsmtip262a5067cd037eb44e8265d3360c20272~-R3pAggmr1631516315epsmtip2j;
 Fri, 10 Dec 2021 03:36:19 +0000 (GMT)
Message-ID: <627fa03ceb971882bc5aedcacac715c5009bdf3c.camel@samsung.com>
From: Hyeong-Jun Kim <hj514.kim@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Fri, 10 Dec 2021 12:36:19 +0900
In-Reply-To: <20211210030815.119153-1-changfengnan@vivo.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIKsWRmVeSWpSXmKPExsWy7bCmvu6FU5sSDd7NlrY4PfUsk8X0joNs
 Fk/Wz2K2uLTI3YHFY9OqTjaP3Qs+M3n0bVnFGMAclW2TkZqYklqkkJqXnJ+SmZduq+QdHO8c
 b2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA7RNSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKr
 lFqQklNgVqBXnJhbXJqXrpeXWmJlaGBgZApUmJCdsffWFeaCR+IVE882sTUwnhHqYuTkkBAw
 kTgyuY+pi5GLQ0hgB6PEw889LBDOJ0aJ148+MoFUCQl8Y5S4tzoCpmPqzFNQRXsZJVZ1fYBy
 njBK7P3/hw2kilfAQ+L0+lfsXYwcHMICdhILd/GAhNkEdCQ+zFrJCGKLCKhLnJq0lAWkhFlA
 S+LtG16QMIuAqsSrz2fA9nIK2Ej8+3uXBcQWFVCTeLXyESvEdEGJkzOfgMWZBeQltr+dwwxy
 goTALXaJI89esUAc6iKxfNcLKFtY4tXxLewQtpTEy/42KLte4viVT6wQzS2MEo+XvmIEOUhC
 wF7i/SULiNs0Jdbv0ocoV5TY+XsuI8RePol3X3tYIap5JTraoAGqLLH57mE2CFtS4umiv4wQ
 tofE2bXb2SEh1c8osXpLI+MERoVZSN6ZheSdWQibFzAyr2IUSy0ozk1PLTYsMIHHb3J+7iZG
 cNrTstjBOPftB71DjEwcjIcYJTiYlUR4b1zdmCjEm5JYWZValB9fVJqTWnyI0RQYwBOZpUST
 84GJN68k3tDE0sDEzMjEwtjS2ExJnPe5//REIYH0xJLU7NTUgtQimD4mDk6pBqYa88uifcc0
 j1zoMH280Cgr1bb+aK9rQ8X/B10rHe7dfr/n3E0v9Vu8PXOi7ns5yZTF7a3/ffCxsG9/YLiS
 dAJDsvvrM/eW3f0gclvPZqryGyYOm1cly+6Gimean5ZcyL6Zc/nEK2K7Lsd4fZwbYGy5Xc7P
 wNj1Wlhl3j7mO4F7WmIdL/DcTEp523FBMoSvYXdwbLPcHufYDqvnn8pWaocf+ax39+g2loD1
 Sxt1fz8XE3hnrWR0be+zQoO3a+Le8+ox6fPH3I3r3myQd7/TQLDI1fjPDZWDjHWMxxbWzXbn
 +bZo9xbmlQc4k9f/3fP+n3SjYoW7d1cEV8TF6zNFtRLOT5fvlrN4//fG7hfsYkosxRmJhlrM
 RcWJAM/yx1cEBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMLMWRmVeSWpSXmKPExsWy7bCSvK7R6U2JBq/+61qcnnqWyWJ6x0E2
 iyfrZzFbXFrk7sDisWlVJ5vH7gWfmTz6tqxiDGCO4rJJSc3JLEst0rdL4MrYe+sKc8Ej8YqJ
 Z5vYGhjPCHUxcnJICJhITJ15iqWLkYtDSGA3o8SSE1PYuxg5gBKSEvPWl0OYwhKHDxdDlDxi
 lJiwqpERpJdXwEPi9PpXYOXCAnYSC3fxgITZBHQkPsxaCVYiIqAucWrSUhaQEmYBLYm3b3hB
 wiwCqhKvPp9hArE5BWwk/v29C3XBZEaJk3fegCWYBTQlWrf/ZgexRQXUJF6tfMQKsVZQ4uTM
 JywQNfIS29/OYZ7AKDgLScssJGWzkJQtYGRexSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yf
 u4kRHM5amjsYt6/6oHeIkYmD8RCjBAezkgjvjasbE4V4UxIrq1KL8uOLSnNSiw8xSnOwKInz
 Xug6GS8kkJ5YkpqdmlqQWgSTZeLglGpgMr45OzShfmtdyI6H1lopCmYpAcmhO7RupS77X+5c
 tOqGybJGzyfTw5usP5/Xez8955fNDO8Nry0O3P9RJ/9l7aK1v7xL2dZ9uHetT0XzhOfeoyZC
 7Qt0si8/DJ/QXOv+NuNvpovXYvazJ7N6PjaVSJQvvfydaf0L3/DnJxnuln1V+iJ56+hZqeDY
 L3Nd3m14d2Le2+1WeQe2vf3FUng/bU7chH8ivzXPcgny+ty+cfm6tvdh9WNu1/SXtqUYLo9a
 Gpkr7DHBfNPNiftj5ybau5uv801+rHVRV/Q20+71K2Y+a2DL4SwN3GLt/yaa68drx/Jvzdne
 nTMN9K5UOp+cxpD71v0K6+5/89WbvG+9DFViKc5INNRiLipOBABsNKvE1gIAAA==
X-CMS-MailID: 20211210033619epcas1p4f2d13fb3e20ff393abc6e4ed2e223bce
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211210030950epcas1p37ad116c9f034dba7962cb52478bb2978
References: <CGME20211210030950epcas1p37ad116c9f034dba7962cb52478bb2978@epcas1p3.samsung.com>
 <20211210030815.119153-1-changfengnan@vivo.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 2021-12-10 at 11:08 +0800, Fengnan Chang wrote: >
 Hi chao: > > As I mentioned before, >
 https://lore.kernel.org/linux-f2fs-devel/KL1PR0601MB400309C5D62BFDDDE6AAD8AEBB989@KL1PR0601MB4003.apcprd
 [...] Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mvX0U-00AiMv-Tm
Subject: Re: [f2fs-dev] A potential dead lock of compress file
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On Fri, 2021-12-10 at 11:08 +0800, Fengnan Chang wrote:
> Hi chao:
> 
> As I mentioned before,
> https://lore.kernel.org/linux-f2fs-devel/KL1PR0601MB400309C5D62BFDDDE6AAD8AEBB989@KL1PR0601MB4003.apcprd06.prod.outlook.com/T/#mbe9a8f27626ac7ca71035e25f5502e756ab877ac
> 
> there is a potential dead lock problem when just remove
> compress file condition in __should_serialize_io().
Hi,

Regardless of removing the condition in __should_serialize_io(), the
deadlock below can occur when Thread 1 is doing checkpoint, as you
mentioned.

We found the deadlock can occur not only between two write_data_pages
thread, but write_data_pages and write_begin.

I will send my patch in a new mail thread.
> The modify like this:
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 9f754aaef558..ffbee94924f3 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> 
> @@ -3218,8 +3224,6 @@ static inline bool __should_serialize_io(struct
> inode
> *inode,
>         if (IS_NOQUOTA(inode))
>                 return false;
> 
> -       if (f2fs_need_compress_data(inode))
> -               return true;
>         if (wbc->sync_mode != WB_SYNC_ALL)
>                 return true;
> 
> This modification is a prerequisite, if there is no modification
> there is no
> problem for now.
> 
> And I make a debug, and here is what I found:
> Thread 1 is doing checkpoint in below procedure:
> 
> Thread 2						Thread 3
> f2fs_write_cache_pages page 0
> 	->lock_page(page) page 0-3			f2fs_write_ca
> che_pages page 0
> 	->f2fs_write_compressed_pages				->loc
> k_page(page) //lock page 0, sleep
> 		->f2fs_trylock_op failed
> 		->f2fs_write_raw_pages
> 			->f2fs_write_single_data_page
> 				->f2fs_trylock_op failed
> 			->unlock(page)  page 0
> 			->cond_resched();			->lock_page(p
> age)  //lock page 0 success
> 								->lock_
> page(page) //try page 1,
> 
> 			->lock_page(page); page 0 //never success
> 
> When Thread 1 do checkpoint and down_write of cp_rwsem, Thread 2 and
> Thread 3
> are write same cluster, Thread 2 start write cache page first, and
> get lock
> page 0-3, beacuse of f2fs_trylock_op failed,
> f2fs_write_compressed_pages and
> f2fs_write_single_data_page will failed, and Thread 2 will unlock
> page 0, but
> keep lock page 1-3 and schedule out, if thread 3 start write cache
> page in
> this time, thread 3 could get lock of page 0, but when try lock of
> page 1, it
> would never success.  Then a deadlock occured between thread 2 and
> Thread 3.
> 
> So, there is a potential limit: We can't write same clutser is
> multithread for
> compressed file .
> 
> If we need to fix this problem, my thoughts is we shoudn't unlcok
> page in
> f2fs_write_single_data_page for compress raw page.
> 
> Do we need to fix this for now?)
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> 
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
