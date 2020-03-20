Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D1B18DBD9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Mar 2020 00:24:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFR09-00031F-3z; Fri, 20 Mar 2020 23:24:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linkinjeon@gmail.com>) id 1jFR07-000318-Ds
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 23:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r1RjSBup4MWDnxcSCK94McxMdoDpG8eO0JDhY4wpKR0=; b=TEqBPw1L9pHjxOT2m1x1pUTeZI
 tyVn3Q7uNzGcr1aUhNaaJLsDLDAlTnqlv41tJHQkC+yTa8SYxGoWpwQ6AWIGDhel2X3RA2/J+8Qfp
 kzvcnIzxWwgd5xM7dhH5n9g5xUqyhg0pzbl3zeU/xeYO6ww8HbBZn1bA+62zTwMBkVF4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r1RjSBup4MWDnxcSCK94McxMdoDpG8eO0JDhY4wpKR0=; b=QkA0z+iVLwNi64sgjhfaJIRMjV
 BcUrjs/cCywjlPEdvU8ecNqF2R5EQK97+RtfFg6O1VJZx4wP6tkHgiug2nT0tAKhjMu3mRV9JBvNz
 dw5OvR1fOY53Wv1SI6qj/R20ZvzWe2/K14z3uR5ArEK++yIiSTWOFuDyCyrKNukTxdgI=;
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jFR05-00AiUZ-3A
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 23:24:27 +0000
Received: by mail-ot1-f68.google.com with SMTP id w26so1818664otp.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Mar 2020 16:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=r1RjSBup4MWDnxcSCK94McxMdoDpG8eO0JDhY4wpKR0=;
 b=vN1/Ute8SimVqT3y3hab78UyOf4VVJ7VRiHOmD/0YEw4RVsLYf+I9I+znQgoZJ4gdB
 ictTZbD1FHachCP/sbEN+nf5NkPQ3zRL8Ac1BelFOIse/g9g6UpeoAfXXPC7J0vE8auY
 ePcveIYKTMSHJgWhosQIxl0CCrkGF9pmyNFPTwd0v+oVmX5riIDdzQ03F5K6zEp+Yorg
 xUhrv1K+sA6wqpG3J43WbuJGu1I6tO2+B7xlqRuhBhDVQUlM25cT94sYTuO+2rNTPHR+
 wUJD/jin1TicQd15MZDDptDmvyxFQ3GYs+b1BI3MQaatUfXjIV8IMG9GTl9ZI1NYxiQ/
 JVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=r1RjSBup4MWDnxcSCK94McxMdoDpG8eO0JDhY4wpKR0=;
 b=J59DG3VVC9l2RUdY4NE45GVRg7USbHLdhvoD0JQI0jktAm2Wx0arvNWo/zFlTowy1R
 WWqwO3/wAxD/mAbDb7e+z0AjYj6ouXM+KRGOoYPDFqoN0tc3TrrpKonQZOhjp3CCMfg2
 v8BYkQqoIKvTYDMV4W7UG3KbzmTDv0Fxvq+XuafECycUpx6QoAPIvmaXknAdTRkfdb9R
 RdZrMdB6LrZHhoAwl/B27wiA3WYTs9StusrZsZTes3AgZHlT5sSKvRQ0jMnOrp4VgOPh
 mNcHjt5DCAusc67hSD7cWecWYvmj+H4A2lFdDVlG2hxgL6zp0s8uP1WdnsS9uHRzWcBK
 JJ1g==
X-Gm-Message-State: ANhLgQ0cNDDXSBpXw1l6cMf/+CCS87KrTe2liRdSMjFo3SQpJjlca436
 krheILeU2m+uPa22OK6cDVqfyRGC2vYcXti3soU=
X-Google-Smtp-Source: ADFU+vvk42JpEDDDlDUp6QEGUIHSuidkoO4gJ/JVIxwHCPUSqqRu1OBVOgg9ZhRrthX3kgHdC2yuDHRY3AYH9iDgANA=
X-Received: by 2002:a05:6830:1608:: with SMTP id
 g8mr9414965otr.282.1584746659261; 
 Fri, 20 Mar 2020 16:24:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:8e:0:0:0:0:0 with HTTP;
 Fri, 20 Mar 2020 16:24:18 -0700 (PDT)
In-Reply-To: <20200320142231.2402-17-willy@infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
 <20200320142231.2402-17-willy@infradead.org>
From: Namjae Jeon <linkinjeon@gmail.com>
Date: Sat, 21 Mar 2020 08:24:18 +0900
Message-ID: <CAKYAXd-NGQvMoYg=TV1T=8OZdQcYwcncK_Hix8OkF0GqmYr9Wg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (linkinjeon[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.68 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jFR05-00AiUZ-3A
Subject: Re: [f2fs-dev] [PATCH v9 16/25] fs: Convert mpage_readpages to
 mpage_readahead
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
Cc: linux-xfs@vger.kernel.org, Junxiao Bi <junxiao.bi@oracle.com>,
 William Kucharski <william.kucharski@oracle.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 Dave Chinner <dchinner@redhat.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> diff --git a/drivers/staging/exfat/exfat_super.c
> b/drivers/staging/exfat/exfat_super.c
> index b81d2a87b82e..96aad9b16d31 100644
> --- a/drivers/staging/exfat/exfat_super.c
> +++ b/drivers/staging/exfat/exfat_super.c
Maybe, You should change fs/exfat instead of staging/exfat that is
gone from -next ?

> @@ -3002,10 +3002,9 @@ static int exfat_readpage(struct file *file, struct
> page *page)
>  	return  mpage_readpage(page, exfat_get_block);
>  }
>
> -static int exfat_readpages(struct file *file, struct address_space
> *mapping,
> -			   struct list_head *pages, unsigned int nr_pages)
> +static void exfat_readahead(struct readahead_control *rac)
>  {
> -	return  mpage_readpages(mapping, pages, nr_pages, exfat_get_block);
> +	mpage_readahead(rac, exfat_get_block);
>  }
>
>  static int exfat_writepage(struct page *page, struct writeback_control
> *wbc)
> @@ -3104,7 +3103,7 @@ static sector_t _exfat_bmap(struct address_space
> *mapping, sector_t block)
>
>  static const struct address_space_operations exfat_aops = {
>  	.readpage    = exfat_readpage,
> -	.readpages   = exfat_readpages,
> +	.readahead   = exfat_readahead,
>  	.writepage   = exfat_writepage,
>  	.writepages  = exfat_writepages,
>  	.write_begin = exfat_write_begin,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
