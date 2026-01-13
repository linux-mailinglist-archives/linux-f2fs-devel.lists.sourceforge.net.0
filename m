Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4533BD19D5D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 16:22:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQb+f43x8qo/qZ7300fcQXE9taOvIJM84t+dXlzGDVQ=; b=N69NNjCS6+vAl9EzdU8PpumHh3
	KC8c5Yv8+STJZI2OQnzEAOSr/7FghKSdPyMwUidJ+dy0Ecx7o5OwBco9x25Y4PFzipcWqPQNdAJk9
	q3X5txWYsDaJwUo6LReUIj9POAd9KvZCRbzQYHoxj/iJW7TrD/YsAw9bV+xVeV8tGiig=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfgDS-0006r8-Kk;
	Tue, 13 Jan 2026 15:21:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b9745b0d722f245fd565+8178+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vfgDR-0006r1-4G for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 15:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PkHPcgL/r2/sQCYYk7Tbgs3xv2a7+rqN3EI5OmY8q6A=; b=SRwHm4ooj8FVMCZQrywjYa8hqD
 mRqEETQLgr4U3sI/imrbpn3Y3DUiXZ8Bd2aHGiCXOuwWUjdXjea9cJSokpz4n7IDoktTMBqyIw08b
 mafGzMxp6SC2rlQKxzTukatV44J3lf0CCu2DtGGi6J6TUyn0HTty8WKkzNwD3wa8xWoU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PkHPcgL/r2/sQCYYk7Tbgs3xv2a7+rqN3EI5OmY8q6A=; b=Z3Zg/suz06T4TCmS/IJUmMek9X
 DYkJqUu5HoPVGe9DkPgK9okftNuNDNeseoSbCkXizanuQei1avEQ6pboeQWXKWZo3rO6LB+GwHdqD
 NlTy5RMIcP0SqAmeylIe2/sjwVyDL4F4DOP8sNqRhhmGr+oJvHBL3Ph+t5b1BO0viR9E=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfgDQ-000149-Q1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 15:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PkHPcgL/r2/sQCYYk7Tbgs3xv2a7+rqN3EI5OmY8q6A=; b=xomA14eVXNDIQFtdd0HHQoTB7E
 zdCyAopaRYT/ZMC1HRDd52yie0ZY9djWOaiJeSSd3JNvbC1NEWAZcsjGHwHmvcGycvYjYLSUAcSze
 tXHmc9c0Fki49NonLagV8PsJ/iPuhUOgcmQb0ASFXPOgGlBUjJ+8kRLLmG301tJmrH/G0bLxaLert
 UC9c6sXNj9n/Ja0qaa3jrPPzv2+Ea5ytTE61XOYk1fawrjxrVkCJb801hU6hRAH+/pVS7dYZkqkLL
 fw96oO4yE2lV/mG64uT0zCNM0k7/uphOCi77birTY2ROcuPQDd7ghnbA71Zf8M5tzKCQHyNI9+r4X
 C8S7fIvw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vfgDC-00000007M9V-0lHF;
 Tue, 13 Jan 2026 15:21:38 +0000
Date: Tue, 13 Jan 2026 07:21:38 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Chuck Lever <cel@kernel.org>
Message-ID: <aWZjAi5rCJk6iVKw@infradead.org>
References: <20260112174629.3729358-1-cel@kernel.org>
 <20260112174629.3729358-2-cel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260112174629.3729358-2-cel@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > + /* case sensitivity behavior: */ > + bool
 case_insensitive:1; 
 > + bool case_preserving:1; Given that not case preserving is by far the
 exception, maybe have a flag for that instead? 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vfgDQ-000149-Q1
Subject: Re: [f2fs-dev] [PATCH v3 01/16] fs: Add case sensitivity info to
 file_kattr
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
Cc: Jan Kara <jack@suse.cz>, pc@manguebit.org, yuezhang.mo@sony.com,
 cem@kernel.org, almaz.alexandrovich@paragon-software.com,
 adilger.kernel@dilger.ca, linux-cifs@vger.kernel.org, vira@web.codeaurora.org,
 sfrench@samba.org, slava@dubeyko.com, linux-ext4@vger.kernel.org,
 linkinjeon@kernel.org, sprasad@microsoft.com, frank.li@vivo.com,
 linux-nfs@vger.kernel.org, ronniesahlberg@gmail.com,
 glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 hansg@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> +	/* case sensitivity behavior: */
> +	bool	case_insensitive:1;
> +	bool	case_preserving:1;

Given that not case preserving is by far the exception, maybe have
a flag for that instead?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
