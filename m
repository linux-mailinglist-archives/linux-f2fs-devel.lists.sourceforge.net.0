Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91835403430
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Sep 2021 08:19:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mNqvp-0001Sr-Fq; Wed, 08 Sep 2021 06:19:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hch@lst.de>) id 1mNqvb-0001SO-V2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 06:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OWq4Uxs42srrgreYr9FPUM1tUTYlrTlruMxtn9k5kYQ=; b=lKtSL202jGtqtBV0+33IW/GN47
 ly0371ZEjZ5t8jbS7kzoMCokQ6qjYTNemMIJ5KjlCcL0QkIk9WMFvmTd6aM84P9iaCFQL6fEiZPfB
 26vqITxBrXb5yR0OvbqM08lmHzOkb906DNGcM5ry3/v1zLIubSEwM8MFuVIFe3XdM3Y4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OWq4Uxs42srrgreYr9FPUM1tUTYlrTlruMxtn9k5kYQ=; b=dmzMtriNkkbgxAvCsm7hdgpLL3
 qFwAesHX/K3cfsjIlyDuQMdBEuAoim7q3noZLCbVUzX0bd58ISAk7Urj/EeHehLAAGME6I0WNqU+d
 lTNa+u5mBK0gm1M+lcPOd2bQ9bSTyyv8Ll3lkQhlFIp3/CIOEE/5X6+B3QFwhicMrG2Y=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mNqva-0027C3-PO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 06:19:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2D17367373; Wed,  8 Sep 2021 08:19:10 +0200 (CEST)
Date: Wed, 8 Sep 2021 08:19:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20210908061909.GA28651@lst.de>
References: <20210818140651.17181-1-hch@lst.de>
 <20210818140651.17181-6-hch@lst.de> <87h7exfj31.fsf@collabora.com>
 <87a6kpfiyv.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a6kpfiyv.fsf@collabora.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Sep 06, 2021 at 06:16:24PM -0400, Gabriel Krisman
 Bertazi wrote: > > ext4_msg("... %u.%u.%u\n", (encoding_info->version>>12)
 & 0xff, > > (encoding_info->version>>8) & 0xff), encoding_info->ver [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1mNqva-0027C3-PO
Subject: Re: [f2fs-dev] [PATCH 05/11] unicode: pass a UNICODE_AGE() tripple
 to utf8_load
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Sep 06, 2021 at 06:16:24PM -0400, Gabriel Krisman Bertazi wrote:
> > ext4_msg("... %u.%u.%u\n", (encoding_info->version>>12) & 0xff,
> > 	 (encoding_info->version>>8) & 0xff), encoding_info->version & 0xff))

I'd rather not open code these shifts and add helpers for them.

> > The rest of the series looks good and I can pick it up for 5.15, unless
> > someone has anything else to say?  It has lived on the list for a while
> > now.
> >
> 
> Ugh, pressed reply too quickly.  Sorry for the multiple email reply.
> 
> In the summary line: tripple -> triple.

Let me resend with the above change.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
