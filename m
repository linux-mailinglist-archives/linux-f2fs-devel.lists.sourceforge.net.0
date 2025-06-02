Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC24ACB184
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Jun 2025 16:20:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DhorYa9z8YWSM0wpO2Xn9WZffC5iWjLjshi7msAfUo=; b=KoeXkHumGFqHvF+NeI7fGnAwUs
	qrsLNoBhHk5l4O+xCCW0ne5C3tHxF82cg+Fan5vX2QlPCaws8TWB84/kHlJzBoH5elEtBvpqOTSCj
	XLwoO+oJam9HTwa5I9xB77sZjPrvi3MNyTzH3z5D8rC2SW0Y8W1UwPzxpQOAJ7iSeanw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uM61m-0002DN-BA;
	Mon, 02 Jun 2025 14:20:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uM61k-0002DH-Pi
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 14:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xJOjThPpfHirzKie02ezE2oEzwyAswWABcYWhG/QSO4=; b=XM8AVbI90yz2u6NpwK5t5JYC5b
 9MNB60qHrjfhFoPvz/u3+VYOxvqvvIiET/SygWBAeMjyIdc+fo51QTCV4zWl4eviJvs4+beoXZcc2
 lYrC6cKhZLcuYnlq5S1jbF09rvW3sRdSBEWQYQqxxnuRvXihbSLuBO/ulGqGsMccK9EM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xJOjThPpfHirzKie02ezE2oEzwyAswWABcYWhG/QSO4=; b=BD/RDadaUDUjwb1u6/vtwrCOsN
 HLIkjMdA64kvx6i5a2Bztb90sbhDF1FZ8s/Y+xs7l51Knxk7FCbaqNmaWP/uU3TSFwTOuyRtD05Z7
 eUXS08DneszyjesyzphsUbL0QGlskjc0mwktF/lmns5hzsgDlYgB+XoNGOEML/GD0mkk=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uM61i-0002KY-IB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 14:20:36 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E5B2B68C7B; Mon,  2 Jun 2025 16:20:19 +0200 (CEST)
Date: Mon, 2 Jun 2025 16:20:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <20250602142019.GB21996@lst.de>
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113253epcas5p1a28e77b2d9824d55f594ccb053725ece@epcas5p1.samsung.com>
 <20250529111504.89912-10-kundan.kumar@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250529111504.89912-10-kundan.kumar@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > } else if (type == DIRTY_DENTS) { > - if
 (sbi->sb->s_bdi->wb_ctx_arr[0]->wb.dirty_exceeded)
 > - return false; > + for_each_bdi_wb_ctx(sbi->sb->s_bdi, bdi_wb_ctx) > +
 if (bdi_wb_ctx->wb.dirty_exceede [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [213.95.11.211 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [213.95.11.211 listed in sa-accredit.habeas.com]
X-Headers-End: 1uM61i-0002KY-IB
Subject: Re: [f2fs-dev] [PATCH 09/13] f2fs: add support in f2fs to handle
 multiple writeback contexts
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
Cc: ritesh.list@gmail.com, jack@suse.cz, djwong@kernel.org, amir73il@gmail.com,
 david@fromorbit.com, gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com,
 hch@lst.de, dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 gost.dev@samsung.com, willy@infradead.org, p.raghav@samsung.com,
 Anuj Gupta <anuj20.g@samsung.com>, linux-nfs@vger.kernel.org,
 da.gomez@samsung.com, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 axboe@kernel.dk, brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>  	} else if (type == DIRTY_DENTS) {
> -		if (sbi->sb->s_bdi->wb_ctx_arr[0]->wb.dirty_exceeded)
> -			return false;
> +		for_each_bdi_wb_ctx(sbi->sb->s_bdi, bdi_wb_ctx)
> +			if (bdi_wb_ctx->wb.dirty_exceeded)
> +				return false;

I think we need to figure out what the dirty_exceeded here and in
the other places in f2fs and gfs2 is trying to do and factor that into
well-documented core helpers instead of adding these loops in places
that should not really poke into writeback internals.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
