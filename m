Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E2A7709C3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Aug 2023 22:35:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qS1Vu-0005Yp-A5;
	Fri, 04 Aug 2023 20:35:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1qS1Vt-0005Yj-6y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 20:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eb93p14LbhHMq9VAU9FSt+DcSUdrlvW15TyYmjztiqQ=; b=cE7vU45XPsF8Me1M4Z5GbRJSx2
 s0olRvnXiT3XPMYKik/qCIxtEWMrKwF2KIfHdlxvMUI1EWGKWfH+wAx4O2cGAwC5a8Vt21T2wSVwP
 2ALOdWdFzIeyCzzQo+Of9JKmQOUcZfK9NA5m0DDRfPEw+e2LDgRQqrV/PFhTWeidZzGE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eb93p14LbhHMq9VAU9FSt+DcSUdrlvW15TyYmjztiqQ=; b=YVgj0JC14nq5u+tqXAWiySbCXp
 lkJ7oiQtSBiE9fHumr/C8pteMG76SmugN9B2ARZV/2MzNpNiqTG8W2FEYoIC1E6UxpqDEmBUyw7wI
 fuH7cAVbgczVgphAKzMClnOyOfsrN99EsIjTuHEMSrJfkf8aX5K7eO73XCJ8tXHFfsvs=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qS1Vt-0000H0-Gd for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 20:35:10 +0000
Received: from cwcc.thunk.org (pool-173-48-112-100.bstnma.fios.verizon.net
 [173.48.112.100]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 374KYoJ9025333
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Aug 2023 16:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1691181294; bh=eb93p14LbhHMq9VAU9FSt+DcSUdrlvW15TyYmjztiqQ=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=Cmbci/Vas57W7Gs1mmt04uOthaR1e+rzdGz6ITDOXZ7ar1BUIxuloHDQosTWOCKWI
 iB56bnyujn38Bh0Bp8Z9EdtMGK5JGqwP/Dc9817D37D5RzTjBcqX7HfyweGFQEIlNc
 BVs1/MrxyUeyzFJS766n80HD2+PFuYOP4G3VM8zfAxBDEfh2gwQRvXgsgqIMcMc0wN
 OtpY0Qeymqh8HbDn2ZQVvOacBb7LkX38rsikz68ioX6wllgIiRTX9csEEqK5ZCQd2m
 kHOKMhSYpzYpG5XePqQ01RloNzfxpmSlLpaGQE5i8Tm2KMJbuA8zWdXQJfaXrlAorq
 d89+IyylQf2+A==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 594D415C04F1; Fri,  4 Aug 2023 16:34:50 -0400 (EDT)
Date: Fri, 4 Aug 2023 16:34:50 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230804203450.GD903325@mit.edu>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802154131.2221419-10-hch@lst.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 02, 2023 at 05:41:28PM +0200, Christoph Hellwig
 wrote: > Just like get_tree_bdev needs to drop s_umount when opening the
 main > device, we need to do the same for the ext4 log device to av [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qS1Vt-0000H0-Gd
Subject: Re: [f2fs-dev] [PATCH 09/12] ext4: drop s_umount over opening the
 log device
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, linux-nilfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 02, 2023 at 05:41:28PM +0200, Christoph Hellwig wrote:
> Just like get_tree_bdev needs to drop s_umount when opening the main
> device, we need to do the same for the ext4 log device to avoid a
> potential lock order reversal with s_unmount for the mark_dead path.
> 
> It might be preferable to just drop s_umount over ->fill_super entirely,
> but that will require a fairly massive audit first, so we'll do the easy
> version here first.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
