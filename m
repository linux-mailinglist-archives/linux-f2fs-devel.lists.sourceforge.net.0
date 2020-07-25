Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 453C522DAB0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Jul 2020 02:00:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jzU5K-0003Yi-Px; Sun, 26 Jul 2020 00:00:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1jzU5J-0003Ya-Ab
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jul 2020 00:00:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Y2Vvcc59HcUjPMvY9ikLgaJUXXEtCMcyorsRU9MvGA=; b=SLMWirjs6ejPKA9A33mzGKJXMf
 XdKlJoIg9aFRrpUl5NBukbhxTFiAGKqeGv+aj65ZddZCoUuL6uyv1fdzg8fJqZvdeZ+DLGyIIKkpR
 ISQLGdfhtACcxLrTbRzQL3/xjHoyiY2aldMLok2iVLnxTriXXDtwxIV3hE3MFuMWo6Fw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1Y2Vvcc59HcUjPMvY9ikLgaJUXXEtCMcyorsRU9MvGA=; b=P403c8SKl4GRvH3J0g4DQdybhE
 CtRzgcz7h0trRl0ec04KnoVf4C0wwV0kWqsacRAUItltQklZrCiHi7Vm0Gc8c+RFF1TJxKMX8hDDJ
 91m5t2XLwMw+9JZxkYOy0q9XO2ugb2SQAntb7KsGsg/KF4lZunclOoL2d80lpPVbgtWU=;
Received: from mail108.syd.optusnet.com.au ([211.29.132.59])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jzU5H-002hXF-SS
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jul 2020 00:00:09 +0000
Received: from dread.disaster.area (pa49-180-53-24.pa.nsw.optusnet.com.au
 [49.180.53.24])
 by mail108.syd.optusnet.com.au (Postfix) with ESMTPS id A7CF21A8F1C;
 Sun, 26 Jul 2020 09:59:54 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jzU53-0001Vy-Lo; Sun, 26 Jul 2020 09:59:53 +1000
Date: Sun, 26 Jul 2020 09:59:53 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200725235953.GS2005@dread.disaster.area>
References: <20200720233739.824943-4-satyat@google.com>
 <20200722211629.GE2005@dread.disaster.area>
 <20200722223404.GA76479@sol.localdomain>
 <20200723220752.GF2005@dread.disaster.area>
 <20200723230345.GB870@sol.localdomain>
 <20200724013910.GH2005@dread.disaster.area>
 <20200724034628.GC870@sol.localdomain>
 <20200724053130.GO2005@dread.disaster.area>
 <20200724174132.GB819@sol.localdomain>
 <20200725234751.GR2005@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200725234751.GR2005@dread.disaster.area>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=QIgWuTDL c=1 sm=1 tr=0
 a=moVtWZxmCkf3aAMJKIb/8g==:117 a=moVtWZxmCkf3aAMJKIb/8g==:17
 a=kj9zAlcOel0A:10 a=_RQrkK6FrEwA:10 a=7-415B0cAAAA:8
 a=Tb48QDFj_K4opPCY4YMA:9 a=wVewhsGeiREcnvQl:21 a=ko93nJrUK3cXB_oi:21
 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 0.0 RCVD_IN_MSPIKE_L5      RBL: Very bad reputation (-5)
 [211.29.132.59 listed in bl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_BL      Mailspike blacklisted
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jzU5H-002hXF-SS
Subject: Re: [f2fs-dev] [PATCH v4 3/7] iomap: support direct I/O with
 fscrypt using blk-crypto
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
Cc: Satya Tangirala <satyat@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jul 26, 2020 at 09:47:51AM +1000, Dave Chinner wrote:
> On Fri, Jul 24, 2020 at 10:41:32AM -0700, Eric Biggers wrote:
> > But again, as far as I can tell, fs/iomap/direct-io.c currently *does* guarantee
> > that *if* the input is fully filesystem-block-aligned and if blocksize <=
> > PAGE_SIZE, then the issued I/O is also filesystem-block-aligned.
> 
> Please listen to what I'm saying, Eric.
> 
> The -current iomap implementation- may provide that behaviour. That
> doesn't mean we guarantee that behaviour. i.e. the iomap -design-
> does not guaranteee that behaviour, and we don't guarantee such
> behaviour into the future. And we won't guarantee this behaviour -
> even though the current implementation may provide it - because the
> rest of the IO stack below iomap does not provide iomap with that
> guarantee.
> 
> Hence if iomap cannot get a guarantee that IO it issues won't get
> split at some arbitrary boundary, it cannot provide filesystems with
> that guarantee.

BTW, if you want iomap_dio_rw() to provide an arbitrary bio
alignment guarantee at the iomap layer, then it should be returned
in the iomap along with the extent mapping. That could then be used
instead of the bdev logical block size. That won't guarantee the
behaviour of the rest of the stack, but it would provide a defined
IO submission behaviour that iomap would have to guarantee into the
future...

That would also remove the need to duplicate the alignment checks
in the filesystem for fscrypt DIO...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
