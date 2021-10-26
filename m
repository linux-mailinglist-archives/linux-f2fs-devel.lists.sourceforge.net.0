Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A617543AD7D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Oct 2021 09:46:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfH9h-0006ii-Dw; Tue, 26 Oct 2021 07:45:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hch@lst.de>) id 1mfH9a-0006hd-U6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 07:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iNMxQQH3gJ43eLQNuM0HF9iWzfr4Xsjd4k8q3spiA0s=; b=MHR76trwIuVQROVy4DpwsyrmBu
 2PRNnpIZYXeLcJxJ+jxLK3lsbpYNVrBNaiWIJH3v2yDFfWlyplBOr75NO55Jd75N32EWw4Aiv61Pq
 Rap9EmtYACOiON9vePKDeCOpvXT1FiMrs3xjuIFkf3irRFz1dtvx/T5r6Www2TBhkv20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iNMxQQH3gJ43eLQNuM0HF9iWzfr4Xsjd4k8q3spiA0s=; b=BnJUgtyooSXTq0b5LmRpLb0IbG
 q7CDhJWot4szERMqH+g3b0PBw5u7wJDIv30rYWfA2ODf+99Ym53jOZZCuGVDNZNc4NzjvQPryf2SR
 Pzu70RoKa5ukIg8iTRIG5r/wjnK5rtQ9xE6qTzfPjD4ewtL6LD2wSfdlNNZ0KiUwkVyY=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfH95-00GYmt-Tp
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 07:45:50 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9C3906732D; Tue, 26 Oct 2021 09:45:09 +0200 (CEST)
Date: Tue, 26 Oct 2021 09:45:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20211026074509.GA594@lst.de>
References: <20210915070006.954653-1-hch@lst.de>
 <20210915070006.954653-11-hch@lst.de> <87wnmipjrw.fsf@collabora.com>
 <20211012124904.GB9518@lst.de> <87sfx6papz.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sfx6papz.fsf@collabora.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Headers-End: 1mfH95-00GYmt-Tp
Subject: Re: [f2fs-dev] [PATCH 10/11] unicode: Add utf8-data module
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

On Tue, Oct 12, 2021 at 11:40:56AM -0300, Gabriel Krisman Bertazi wrote:
> > Does this fix it?
> 
> Yes, it does.
> 
> I  will fold this into the original patch and queue this series for 5.16.

This series still doesn't seem to be queued up.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
