Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB63C7F0E2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 07:29:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SA2j34aXlwk0cG0Bp+o9VzyFaNNGp4qrxQajVx4Yt7I=; b=ZARk6beDd9SrPGyBcA/n8ir+i8
	C6Uy9tJUP3ifK6om0osyrVcL8YhISF7+KmN3jHjvZLaigsfNw+vecqLlayh+IGgF+8qzNLe3XdAVD
	BOsvvjrpucb6VVTME6VfyZPqj8rgkbwKWvO6df8mGtjfdgwf15aeqrFCsbu1OLzGubmY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNQ4V-0006SH-SM;
	Mon, 24 Nov 2025 06:29:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vNQ4U-0006S8-2z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 06:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qfhWGUq06KJLXqW/n3kz0UhTOrfBK9Bhsf1cCUsicW4=; b=FvZHQNn2KbIt3SL7HoinH8a9b7
 hVbetdK1z9QBITEA6e4e8BU/JueczCKOCN4ct4cFLVVS9nCzFCLmSV0qLOGDXNDoYQfEkFqoyR+wK
 zJRwTOWQeXO6q20SwsBUHNJNkmPNyMLe4Wi2Ta1BIwIdfOLfaxDOY3Mggi37ZAgXqN4A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qfhWGUq06KJLXqW/n3kz0UhTOrfBK9Bhsf1cCUsicW4=; b=NajNArrxhpp0yLRwRG2xs4pv1h
 21Efm9zjEhdtxtPakQYxqHpqide6xUfCC7AXX2cezdxXuROZJc+9OeaFCWjl4Wg0L5TqBp10WGJoU
 /7m18FqnY/a6vZBoqJ4hdRdvoWlQlLk71G1xLxs6/zbNGsMXfb+gIUEdXHEaHtQrSmPc=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNQ4T-00075d-Kz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 06:29:10 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3976468B05; Mon, 24 Nov 2025 07:28:56 +0100 (CET)
Date: Mon, 24 Nov 2025 07:28:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
Message-ID: <20251124062855.GA16765@lst.de>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-4-ckulkarnilinux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251124025737.203571-4-ckulkarnilinux@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > + nvmet_lba_to_sect(ns, range.slba), > + nr_sects,
 > + GFP_KERNEL, 
 &bio); This can be condensed a bit to: nvmet_lba_to_sect(ns, range.slba),
 nr_sects, GFP_KERNEL, &bio); 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vNQ4T-00075d-Kz
Subject: Re: [f2fs-dev] [PATCH V2 3/5] nvmet: ignore discard return value
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
Cc: axboe@kernel.dk, dm-devel@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, kch@nvidia.com, sagi@grimberg.me,
 linux-xfs@vger.kernel.org, cem@kernel.org, snitzer@kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org, song@kernel.org,
 mpatocka@redhat.com, jaegeuk@kernel.org, bpf@vger.kernel.org, yukuai@fnnas.com,
 hch@lst.de, agk@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> +				nvmet_lba_to_sect(ns, range.slba),
> +				nr_sects,
> +				GFP_KERNEL, &bio);

This can be condensed a bit to:

				nvmet_lba_to_sect(ns, range.slba), nr_sects,
				GFP_KERNEL, &bio);

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
