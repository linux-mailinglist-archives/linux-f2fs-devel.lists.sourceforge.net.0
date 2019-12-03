Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AC710F4B6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 02:52:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ibxMf-0003a2-2S; Tue, 03 Dec 2019 01:52:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andreas.gruenbacher@gmail.com>) id 1ibxMe-0003Zt-E7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 01:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TxhmjFxB0fSH7WF0Z6dyOJrwDyDBweaa0/5KnNO4AIw=; b=M1WGEsCbUQORUK7fbc0JwShN6u
 BL8lMqZtjT12duO38brIKc6+f4Y0m5BJfBrdrhphtyUqJz+gFUPNLaiMllbNbcdsV9oNFcTJLF+Cy
 QJE8OTA/3lYxd75FARWTjVN52zRqU53psUPp5ENNcAqAztTgpY/8Rw4v5b3xoP06k9Bs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TxhmjFxB0fSH7WF0Z6dyOJrwDyDBweaa0/5KnNO4AIw=; b=lc9WbKATh/tz9q+yPpxaaICf9g
 3lWgxv+iwluM+yec0OymWDig9s36jacSg3RJ659IfqVyueOOnrfCpFtznLu+fnDNphZWXt/MzRkFK
 bd9JGfvQT6sZ9nRNegGUEh3sAWcCWLFmrdUI/FxvbOapMU5WwL8HGfSVTOWVbTSd7mWE=;
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ibxMd-0056fw-6x
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 01:52:32 +0000
Received: by mail-io1-f66.google.com with SMTP id l17so1851612ioj.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Dec 2019 17:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TxhmjFxB0fSH7WF0Z6dyOJrwDyDBweaa0/5KnNO4AIw=;
 b=Xah07E77EL/ykU6H/9fOr3zX6G7oIlWdMl7pW0DtOY4vE5v7mHQywBuRicQbOxpksI
 oVlMR+lFoPd7LKC19a9HB2/wy/+jDp1nqd76VCZFCXYDbcb0C0lFjdfWx07BFtI61NyQ
 ULUpd+qRbkc1lNFMKvsoL6LpvtelvqGIpA+TiKw+pssj6AYPYx8QilsR5BTdNjSgzXV4
 TzOcqVnnTq03A9VJMHGxKZI9llFscQefkxFMrIAIJ8purFDg+fn3Sgw7mITq1bI0VNc4
 ggGt0dKL3T+x/JX3njY7HBts2xJIycvxD925/sF8Btt8swkgBaabvykwCkAgzw+wuURe
 7mSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TxhmjFxB0fSH7WF0Z6dyOJrwDyDBweaa0/5KnNO4AIw=;
 b=fUX4UlcJ2qxhtiaFlKkwrd7P0WbEBex1ksFEblfnUkQVRi5ZoGIVTIHLGSICid76pl
 zcvzrRT9MS/KyDeiTCukIoIW9uWbJQcICK5GT7+i4POK8BMl8LL0nQQuQhzSRZC/qGgN
 CjzUKM1orpxciodxkncbPYQFeGcCplXBhIZhRi8LtQbxip36hxeDjAHrLARH48yI5YOO
 9F2LkOd5ixMAGtRWlfKk3KAb9nYCghfG9XJVfNCnOIKpPjc97Fxv+LdbJFCxRhn+xHhj
 AfgWsdfwIm06A34fEcS9ZSd2GqeEfwpmwfDBZ45pdX02Au2TeMs6vBfABnfwCJP4XMln
 catw==
X-Gm-Message-State: APjAAAWnDPq3oCfna2ZwTDyA6nSyhUh7W3a+9+mvCJbMac8hzHXinox3
 vLr/8c83RXlK50texxH/H/naRcvJjPKy9/2BTCDWisXSNKM=
X-Google-Smtp-Source: APXvYqz/HtSAKmFvtGA3vewcbEqy6GpkXcTpGWeY7zvzD8UPDmBHZYqWa5qgMjPw9AT+xjcV03w5DfEQU74871jze0c=
X-Received: by 2002:a02:a915:: with SMTP id n21mr3314772jam.117.1575337945183; 
 Mon, 02 Dec 2019 17:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20191129142045.7215-1-agruenba@redhat.com>
 <CAHk-=wj5caXKoukPyM7Zc6A0Q+E-pBGHSV64iZe8t98OerXR_w@mail.gmail.com>
In-Reply-To: <CAHk-=wj5caXKoukPyM7Zc6A0Q+E-pBGHSV64iZe8t98OerXR_w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 3 Dec 2019 02:52:13 +0100
Message-ID: <CAHpGcMLe2Qy=RdcyFPav5Rfto9M4S9VdsX6E=b3FEywtUNQdqg@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (andreas.gruenbacher[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-foundation.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ibxMd-0056fw-6x
Subject: Re: [f2fs-dev] [PATCH v2] fs: Fix page_mkwrite off-by-one errors
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
Cc: Adrian Hunter <adrian.hunter@intel.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
 Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ceph Development <ceph-devel@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Artem Bityutskiy <dedekind1@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs <linux-xfs@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Am Di., 3. Dez. 2019 um 02:09 Uhr schrieb Linus Torvalds
<torvalds@linux-foundation.org>:
>
> On Fri, Nov 29, 2019 at 6:21 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > +/**
> > + * page_mkwrite_check_truncate - check if page was truncated
> > + * @page: the page to check
> > + * @inode: the inode to check the page against
> > + *
> > + * Returns the number of bytes in the page up to EOF,
> > + * or -EFAULT if the page was truncated.
> > + */
> > +static inline int page_mkwrite_check_truncate(struct page *page,
> > +                                             struct inode *inode)
> > +{
> > +       loff_t size = i_size_read(inode);
> > +       pgoff_t end_index = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
>
> This special end_index calculation seems to be redundant.
>
> You later want "size >> PAGE_SHIFT" for another test, and that's
> actually the important part.
>
> The "+ PAGE_SIZE - 1" case is purely to handle the "AT the page
> boundary is special" case, but since you have to calculate
> "offset_in_page(size)" anyway, that's entirely redundant - the answer
> is part of that.
>
> So I think it would be better to write the logic as
>
>         loff_t size = i_size_read(inode);
>         pgoff_t index = size >> PAGE_SHIFT;
>         int offset = offset_in_page(size);
>
>         if (page->mapping != inode->i_mapping)
>                 return -EFAULT;
>
>         /* Page is wholly past the EOF page */
>         if (page->index > index)
>                 return -EFAULT;
>         /* page is wholly inside EOF */
>         if (page->index < index)
>                 return PAGE_SIZE;
>         /* bytes in a page? If 0, it's past EOF */
>         return offset ? offset : -PAGE_SIZE;
>
> instead. That avoids the unnecessary "round up" part, and simply uses
> the same EOF index for everything.

And if we rearrange things slightly, we end up with:

        /* page is wholly inside EOF */
        if (page->index < index)
                return PAGE_SIZE;
        /* page is wholly past EOF */
        if (page->index > index || !offset)
                return -EFAULT;
        /* page is partially inside EOF */
        return offset;

Thanks,
Andreas


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
