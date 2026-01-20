Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04114D3C0A3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 08:38:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbmGknJm8MZWIqaZ7tALkEM4ZWO8x29iT5h/FPRb7rU=; b=CxrUvgTdjBdkXKNYCKX3KkhRVw
	hfu3bTGj+AWC9v8rrdVUQ/wEEsYA9eIFWJC80ERtIgNTB6UEigejuhvVwTwBhR2ZEjAvnkxWoMkfi
	i7z54cWge4enEs/8gLV4sjs+yP8Wl082t70aYHwlp12kDGJRqu71XkEoux726l3Ln1Do=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vi6K2-0004MV-Mh;
	Tue, 20 Jan 2026 07:38:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+6f87a82fb8d0462b7f15+8185+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vi6K0-0004ME-KV; Tue, 20 Jan 2026 07:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MWgDWsJcZSPLDHs9IJsUoi9AsdVhP2NHHfcQigencrE=; b=KIoB5L0XfspvGwt4mIwRd8E0br
 Gd4lVHOvio+3W+c5rUXuQr6418AYRQt7M/RxQEb/BxlJgi/h0wZD4h14eUJxEx7G0VT983myB4BgS
 OWTgcD5NdogDQPzNaRFfBms7WcSgp37e4DEVVDGu7gPKQvURv7xWwXynp/vv0U14oEoM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MWgDWsJcZSPLDHs9IJsUoi9AsdVhP2NHHfcQigencrE=; b=XaU1sjPoZx/1MLz25vDcSiN6Yi
 hnPJtTvWgyPjDvBmWSxcBPdTu9K1TKXr9ZNgfCsgclJ3AaeSKuXUpkQ3dhXi1x8fUPYVmjXRlfJbS
 9Q67qrgYWkp2j+tN+pOyjwlFcUJOusdLkKtPr6WnkJMFPl/sxub+EqYgU3Iqs/8MlUZ0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vi6Jz-00086y-ND; Tue, 20 Jan 2026 07:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MWgDWsJcZSPLDHs9IJsUoi9AsdVhP2NHHfcQigencrE=; b=QQjy8UtfJINxBhZn7YjEMtg5bI
 RR/UTX6ry3NKZFPfoe8NvA46huniC8Qe5WKKYr9odSic6x/azSx6ttNuGshX1v/vo0/uShB8r7jvu
 oQsFb6UppuK9W5J+pQ3LkkqP9wItu6+F+hdSK/8VV2v841T7dec2Zxhhl1cf/V6K+X8k3OQle+nM1
 +QFFtmJGhnxZTPqgAKCdQOUJoPKo1QuoWKyKACFSMKWKPzqQYD3//Ir7gB2tYr9y/jfHBn8vwIeOu
 m3+XtJchvn4RXotvr9JWjd2NEnaFbSv/vkLKgykdLYa9ocsv+hA7DGOxFY+mj7v7P2zZZO29/i/nl
 B9PJVAUw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vi6JN-00000003MRN-2vIx;
 Tue, 20 Jan 2026 07:38:01 +0000
Date: Mon, 19 Jan 2026 23:38:01 -0800
From: Christoph Hellwig <hch@infradead.org>
To: NeilBrown <neil@brown.name>
Message-ID: <aW8w2SRyFnmA2uqk@infradead.org>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>
 <176877859306.16766.15009835437490907207@noble.neil.brown.name>
 <aW3SAKIr_QsnEE5Q@infradead.org>
 <176880736225.16766.4203157325432990313@noble.neil.brown.name>
 <20260119-kanufahren-meerjungfrau-775048806544@brauner>
 <176885553525.16766.291581709413217562@noble.neil.brown.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <176885553525.16766.291581709413217562@noble.neil.brown.name>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 20, 2026 at 07:45:35AM +1100, NeilBrown wrote:
 > This sounds like you are recommending that we give in to bullying. I find
 your suggestion that anything you disagree with is bullying extremely
 offensive.
 If you have valid reasons for naming something after the user instead of
 explaining the semantics, please explai [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vi6Jz-00086y-ND
Subject: Re: [f2fs-dev] [PATCH 00/29] fs: require filesystems to explicitly
 opt-in to nfsd export support
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, linux-mm@kvack.org,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Chuck Lever <chuck.lever@oracle.com>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 20, 2026 at 07:45:35AM +1100, NeilBrown wrote:
> This sounds like you are recommending that we give in to bullying.

I find your suggestion that anything you disagree with is bullying
extremely offensive.  If you have valid reasons for naming something
after the user instead of explaining the semantics, please explain that.

If you think NFS actually explains the semantics pretty well, please
explain that too, especially in forms that can be put into
documentation, including for the user ABI.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
