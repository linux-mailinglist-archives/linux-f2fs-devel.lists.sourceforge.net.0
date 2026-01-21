Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIluKdLqcGk+awAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 16:03:46 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB2D58E5F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 16:03:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qugyrCl4+q/A4vL754mEXs/maN5Y/ZQYTYN2MKitHNw=; b=dy7XYG/z0TylDV0Yt78UgXuE9C
	0RRkiopOjySqsbyNfAOo1liruNuZcLwz8dYFGwA/AFeqJxv1KoLVImAic5tJabdaexWhAMABoAukh
	0wu9odW4QJyC5Fz/q6wMmjDhIaOjIkBbM3W9wKv8wuk32N8F4fNJK0bjW9K7YX+a96Zg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viZkA-0005I3-NW;
	Wed, 21 Jan 2026 15:03:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1viZk8-0005Hx-Mg
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jan 2026 15:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DqHAqIOo0KRqteg6PWKdenv5VYX2rGWJWrWdPtH1CUc=; b=B9E7DHV+qIX9PbMMuzXe0xQfp5
 3I1YHzDkzETVm/gxiPUXR2Mm1IptmeH5BZawCkIbmovF2qwe5SFj2KJw7hKCsQoyoAQ/G9s9sq2r8
 1OE+LnHis/V7ADEeeUaqwdSFYBgwQm0Z5mNCoVmaq6708odz2oIky5s/Jsh5sT2qRftQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DqHAqIOo0KRqteg6PWKdenv5VYX2rGWJWrWdPtH1CUc=; b=gvgDhasWIGBwU6whdKbA9AwdRn
 TJ7g9L/hAHLu/M8R7Gkyq/U8uaiPrCnF/LEwV+ueSnLLtaqdYWmVSQJijilm57H+ilHIjr7s7Zen+
 yJxNwyKoO21oKbw8OhN8f4d0RDbeWTs6KXQC8sc78txYEWcQJtOuoGEagDP74wvtvNls=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viZk8-0003nf-2a for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jan 2026 15:03:36 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5C378227AB0; Wed, 21 Jan 2026 16:03:21 +0100 (CET)
Date: Wed, 21 Jan 2026 16:03:20 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20260121150320.GA14702@lst.de>
References: <op5poqkjoachiv2qfwizunoeg7h6w5x2rxdvbs4vhryr3aywbt@cul2yevayijl>
 <aWci_1Uu5XndYNkG@casper.infradead.org>
 <20260114061536.GG15551@frogsfrogsfrogs>
 <5z5r6jizgxqz5axvzwbdmtkadehgdf7semqy2oxsfytmzzu6ik@zfvhexcp3fz2>
 <6r24wj3o3gctl3vz4n3tdrfjx5ftkybdjmmye2hejdcdl6qseh@c2yvpd5d4ocf>
 <20260119063349.GA643@lst.de> <20260119193242.GB13800@sol>
 <20260119195816.GA15583@frogsfrogsfrogs> <20260120073218.GA6757@lst.de>
 <5tse47xskuaofuworccgwhyftyymx5xj3mc6opwz7nfxa225u6@uvbk4gc2rktd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5tse47xskuaofuworccgwhyftyymx5xj3mc6opwz7nfxa225u6@uvbk4gc2rktd>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 20, 2026 at 12:44:19PM +0100, Andrey Albershteyn
 wrote: > > > I'd leave the ondisk offset as-is, but change the pagecache
 offset to > > > roundup(i_size_read(), mapping_max_folio_size_supp [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1viZk8-0003nf-2a
Subject: Re: [f2fs-dev] fsverity metadata offset,
 was: Re: [PATCH v2 0/23] fs-verity support for XFS with post EOF
 merkle tree
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, aalbersh@kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, david@fromorbit.com,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, jaegeuk@kernel.org,
 linux-fsdevel@vger.kernel.org, tytso@mit.edu, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@redhat.com,m:fsverity@lists.linux.dev,m:linux-xfs@vger.kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:david@fromorbit.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:hch@lst.de,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lst.de:mid]
X-Rspamd-Queue-Id: 1EB2D58E5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 12:44:19PM +0100, Andrey Albershteyn wrote:
> > > I'd leave the ondisk offset as-is, but change the pagecache offset to
> > > roundup(i_size_read(), mapping_max_folio_size_supported()) just to keep
> > > file data and fsverity metadata completely separate.
> > 
> > Can we find a way to do that in common code and make ext4 and f2fs do
> > the same?
> 
> hmm I don't see what else we could do except providing common offset
> and then use it to map blocks
> 
> loff_t fsverity_metadata_offset(struct inode *inode)
> {
> 	return roundup(i_size_read(), mapping_max_folio_size_supported());
> }

Something like that, yes.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
