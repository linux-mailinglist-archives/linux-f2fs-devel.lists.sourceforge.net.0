Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EBC93A1AC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2024 15:37:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWFhj-0002hB-SI;
	Tue, 23 Jul 2024 13:37:23 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+3e265a4a9aa486cd5844+7639+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1sWFhg-0002h4-3e for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 13:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cQRHyNXL3w6huhz8TyiMZxjBFclafzptvvSA+EclITA=; b=dCpL8jepi3/d6ONDWx0uJsPm89
 mZW2JOZ0YgYTggRiFO5FjmDrxBg9hhOmQKmPKhCuBUyF5OsJ0DeFAG6PO36DumggBzAwOWYZCRFEJ
 s4TLqz5BNBggSSvzgkqU2uTAEvC1XjQyTmUm2mP2lxEt/GZeA6ISn7jsKRyXHlds2/7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cQRHyNXL3w6huhz8TyiMZxjBFclafzptvvSA+EclITA=; b=Gx7ZZZPEu7r6uHKJGM+CyZP5BR
 TnHpQHq/w2IGDyiNWxhcED5IFLxgnfFtRdiGcgqmxBL3Mz0i7aCJDWl3z1j+pBZMZHqwxIfbSKE5W
 Sux99uhXgOl8zwxqRe/nA1HZRlTRUmsRHBGxzqi3CPstS964e03pqA0TtikNTLeCV+PA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWFhf-0000Ew-Fm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 13:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=cQRHyNXL3w6huhz8TyiMZxjBFclafzptvvSA+EclITA=; b=nlYrEs+CwE5yOSVXh8sNf1Tey8
 g4FuX77+0cv7nVi6DJhB7mo3aIluINkKkpPDmOKZJtF2gVtcXx4EyruLqot5CnPgx8ClkO8NAl38I
 vk4ly1n/XTQ/xcgrclVU5KVi5g+Ld0zWFY3w0f8yig2YpsdeECGPBbcajHkeBk0wFSrz08f+Ez5xS
 D5xKE+IYVy0tdqTvH3QJPIkjwMvbt7/6Y2aM+naoqUjeFqSHENpKXEVBIFZcIasWsy2PsHgeP6Bgl
 ubj2B6Biye9mBU7oyBe6202b+0H+COUNZDWoOtrzW1IAT2BtlnTRyp4nOleGNjbe1pjVV7SAYG9E7
 njlPGo9g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sWFhP-0000000CZQi-0A45;
 Tue, 23 Jul 2024 13:37:03 +0000
Date: Tue, 23 Jul 2024 06:37:03 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Youling Tang <youling.tang@linux.dev>
Message-ID: <Zp-x_zm7Jp1FBol5@infradead.org>
References: <20240711074859.366088-1-youling.tang@linux.dev>
 <Zo-XMrK6luarjfqZ@infradead.org>
 <b58e6f36-9a13-488a-85d2-913dd758f89b@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b58e6f36-9a13-488a-85d2-913dd758f89b@linux.dev>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jul 23, 2024 at 04:44:14PM +0800, Youling Tang wrote:
    > Thanks for your suggestion,  I re-implemented it using section mode, >
   and the new patch set [1] has been sent. Nice! I'll review it. 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: infradead.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                        [198.137.202.133 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                           [198.137.202.133 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [198.137.202.133 listed in list.dnswl.org]
X-Headers-End: 1sWFhf-0000Ew-Fm
Subject: Re: [f2fs-dev] [PATCH 0/3] Add {init,
 exit}_sequence_fs() helper function
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, Chris Mason <clm@fb.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, tytso@mit.edu, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 23, 2024 at 04:44:14PM +0800, Youling Tang wrote:
> Thanks for your suggestion,=A0 I re-implemented it using section mode,
> and the new patch set [1] has been sent.

Nice!  I'll review it.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
