Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD56379EA4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 06:36:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgK8T-0007Fh-Ar; Tue, 11 May 2021 04:36:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from
 <BATV+07fa2649c4d3713ca179+6470+infradead.org+hch@casper.srs.infradead.org>)
 id 1lgK8R-0007FV-6g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 04:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+LTUHNeE94R2O+bXANYuERUrQYGZz1p62AmaYL7iaa0=; b=NLJB4Mlz0BogzdNgXa3sxahpJY
 P6jE9u0Bkw4JnVN8/XAjC9wuVHJ4PIM5bV0RufpdyDyDBBxof5Gx7R7zc67wtAEvh2Q7TsoaCPfQP
 Gpljt5zqZoHwM5rQboQ0nzI06n3cfpvwFEPmV7oZLLGDlaJmJ9hoSqtuxL7r4CWroLic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+LTUHNeE94R2O+bXANYuERUrQYGZz1p62AmaYL7iaa0=; b=Pfyo9O9LUB9hkY0Jcht8XJu4EH
 bTxlNAo9I+PDNE5dtA0zj+sEMnxjQNV7q1jH02YwTqLdh1ok4dBYjypfGom1P1L+qDVhvXdEIW8Dm
 /N5I2xCB/TIwrRZdcNtoGF6EPIn7dJVCI3oQvleiiBgF1BHArQHNFQpshOC3Bb8tkNAA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgK8L-003OYF-OG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 04:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+LTUHNeE94R2O+bXANYuERUrQYGZz1p62AmaYL7iaa0=; b=PpezK03OB1C8eJRbNdZYTJmHU2
 YxbOUgtOt0V/rQha8ZqXlibpnp+YftcHnNgOLUQLAlOi3VeRiXaY0063okKKZvwXPwyJNguaaK1rZ
 UdSK5B7Kzbl/ITLs7uwYebhy0zBDHIOzE3Fo5BeNq5LwjuMAhZ7b1TT8NzW5xoViWmxIS7QOVoXT5
 jtWz0+pf6tJJaV4mRLIKZt/09eoLkay840VzOzmzr+B/H6LGqW+isqgpLa+yI3BxFnbAFW/UjgOVh
 G/uOcpTscOBvaeezfId6QazbqH51Ap/i1ATpWCMA/xK68Fzs3VZ9MLDAMxSngDC8VnnABhoNRnJSe
 UbtwTE2g==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lgK7b-006uVb-KJ; Tue, 11 May 2021 04:35:54 +0000
Date: Tue, 11 May 2021 05:35:51 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Shreeya Patel <shreeya.patel@collabora.com>
Message-ID: <YJoJp1FnHxyQc9/2@infradead.org>
References: <20210423205136.1015456-1-shreeya.patel@collabora.com>
 <20210423205136.1015456-5-shreeya.patel@collabora.com>
 <20210427062907.GA1564326@infradead.org>
 <61d85255-d23e-7016-7fb5-7ab0a6b4b39f@collabora.com>
 <YIgkvjdrJPjeoJH7@mit.edu> <87bl9z937q.fsf@collabora.com>
 <YIlta1Saw7dEBpfs@mit.edu> <87mtti6xtf.fsf@collabora.com>
 <7caab939-2800-0cc2-7b65-345af3fce73d@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7caab939-2800-0cc2-7b65-345af3fce73d@collabora.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lgK8L-003OYF-OG
Subject: Re: [f2fs-dev] [PATCH v8 4/4] fs: unicode: Add utf8 module and a
 unicode layer
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
Cc: ebiggers@kernel.org, Theodore Ts'o <tytso@mit.edu>, drosen@google.com,
 ebiggers@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 kernel@collabora.com, adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, andre.almeida@collabora.com, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, May 11, 2021 at 02:17:00AM +0530, Shreeya Patel wrote:
> Theodore / Christoph, since we haven't come up with any final decision with
> this discussion, how do you think we should proceed on this?

I think loading it as a firmware-like table is much preferable to
a module with all the static call magic papering over that it really is
just one specific table.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
