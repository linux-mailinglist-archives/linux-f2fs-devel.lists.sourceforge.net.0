Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 758636DD15C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 07:02:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pm694-0006UE-Br;
	Tue, 11 Apr 2023 05:02:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c6fa32d9e84a85109083+7170+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pm692-0006U8-0k for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 05:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KBhNfUOcD8iQz+TMuW2IJQH6CYVeRvhGPDElxngGpyE=; b=J66z19h0Jh6UwGvpuNNj7WEVNn
 w0PllaTxR7h2y6qGe8SiqxcOzAVbBzGl+hKj3dn3/u5miYgUajubC+AnFAQ58ziKQ3gvO+rroMRQ1
 p+Q0HKqtd4LTCNezPpOzmh8v5NRa40O6WE7Sn5FM1yYn4jmhwoz1hdEHgu2DQgj3ZQNg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KBhNfUOcD8iQz+TMuW2IJQH6CYVeRvhGPDElxngGpyE=; b=RG/D/sG+9mkFbvbvA3KiNXcqhV
 8krZZAPTB2m/wc2tTBAcKQwZBJlKduaruqCzHEQgAWnZgnkY77f1TlHITeWmcNJlbxWSIHhFXgA8W
 sSyxbQPZXC92wrhPinig0otetF/pPeMotfjsRr+DDzD3z1RohL8g7znhkCH56tNHgrpY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pm68x-00055Q-Cb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 05:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KBhNfUOcD8iQz+TMuW2IJQH6CYVeRvhGPDElxngGpyE=; b=SuYCXB7pkcbxWbG1OHBZx7juNA
 pku0+MY68aN+S95h6lBSIC3+WUupYPcZ/eHTEqYAFMoLUQnYO8MeMYSbBdMCyQylUcDHHLHcmIXd7
 e5NqbRZSQB0gMOfbiVnUErygHRgsOtoOGaC/2EcI+J1zpIrNhA2wJV2TkXNBC4tU7LeHeSTqUrrZO
 VIlNf2JBzbM+1SJ8Gb7TZBAgltRuPGZead5QKLPM2er7apLZLYmpxUY511LIx0AYMvAIJ3J+L1juU
 k1OlPAFQtvgOTFojCSEo3+oOplG9rBmr5OVIw9zq4j1KxjAJOgfkDHNzOUYwe4/ft+nr670+zJOBn
 JIilyNgg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pm68l-00GQYB-0D; Tue, 11 Apr 2023 05:01:59 +0000
Date: Mon, 10 Apr 2023 22:01:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <ZDTpx15RX/64lbjY@infradead.org>
References: <20230406003714.94580-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230406003714.94580-1-ebiggers@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 05:37:14PM -0700, Eric Biggers wrote:
 > Therefore, let's convert fs/verity/ from ahash to shash. This > simplifies
 the code, and it should also slightly improve performance for [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pm68x-00055Q-Cb
Subject: Re: [f2fs-dev] [RFC PATCH] fsverity: use shash API instead of ahash
 API
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
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 05:37:14PM -0700, Eric Biggers wrote:
> Therefore, let's convert fs/verity/ from ahash to shash.  This
> simplifies the code, and it should also slightly improve performance for
> everyone who wasn't actually using one of these ahash-only crypto
> accelerators, i.e. almost everyone (or maybe even everyone)!

This looks like a very nice cleanup to me.  So unless someone really
uses async crypto offload heavily for fsverity and can come up with
a convincing argument for that, I'm all for the change.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
