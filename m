Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMZSKzG5zGmcWAYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Apr 2026 08:20:33 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A163751E1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Apr 2026 08:20:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wm6M8g3tNw4J22u0WTkeVmdqoAYabarKedbybINitnY=; b=NrhEn2hdma+ucZX9hJgptVd3/r
	DM5Nto0o/vUGIribpbCMbS/CerT0Odq2KaSsGLMcO6t5KJ4nE5iDCC/TTlJekNfqz6v4Mymfl6vZZ
	PFd0SMBa+AAh05zJQANgM0HNmNK1w1JS+u5eD9U/0UKPTUsb2reQ0rNG+jN6zvnHKhuM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w7owA-0006qk-OZ;
	Wed, 01 Apr 2026 06:20:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+83c2b452eb0a1c715696+8256+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1w7ovw-0006qD-23 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Apr 2026 06:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VIuJiRmgRUKwoy4fZIyvENNhSRANuGUnd7EenkJHAIg=; b=Nnr/FKAOJnwHyTQuuG2P0AUIW4
 8z+VZUY2II6BKpErlIEoy3BJnboW2OCldx9D/RecpfDk7lGrhGQmja/pmo3A70fUlfpwyy7IQlDWP
 UZSQPdBb9M0J9YK0J+hoMDpXtg4Udisu1btFLlnX+76Z+RIMF2i6XbHRq2QqrIP2Nxk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VIuJiRmgRUKwoy4fZIyvENNhSRANuGUnd7EenkJHAIg=; b=gmu4ZW0/h2xtB8PDQC3PSG7pT/
 2IjHHXAff1SOQctooOthLe2wekzrB56jCob3eKw+E8ljJvLPVgcke3RvNnf9Dg8CyFFQ2TgTCUn+r
 CoBCinwpHSg+Z64occpsEVf5ZBNeMLC4+QwNT5MxboXZ+qTuWvMM00YcPeCI2BImocpQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w7ovv-0000JJ-EH for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Apr 2026 06:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VIuJiRmgRUKwoy4fZIyvENNhSRANuGUnd7EenkJHAIg=; b=livugy9Ca1D/o0BR8zTZKaF20x
 v/BiGYOJmKmznWvsZ/LeezVXLNWGPNxdqr8t0gLl3cesDGvdD3tCZvxtSFlnZFVovNxj/mK298iek
 0PzkjaM1Myc0XbuOtxlK8KE6cpYEK9Z4KJNs5N8h9v4SkVFpGGTWi6RrkOJAEPIwrs5p5VV73ExvI
 N3Cu+pM0zDcHUXqhPn2Gchy2NOqfhwF6+RrNFsdiLTrk41NPigYn2AXNxj4EcuYzzeMF27Q+VEO3d
 NLGM5qKFZonzdcJkDlwjTR2/k5EvedYGIdcpzo5Z4XPzjkp07Dv97Hkm5PkexMyFxFW6/c7neboNe
 qNkT+y8Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1w7ovk-0000000E6NX-1IDw;
 Wed, 01 Apr 2026 06:19:56 +0000
Date: Tue, 31 Mar 2026 23:19:56 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Zorro Lang <zlang@redhat.com>
Message-ID: <acy5DBohMXkFXd-_@infradead.org>
References: <20260324025656.493776-1-chao@kernel.org>
 <acN4PWKHvk_33VB7@infradead.org>
 <20260331201105.xxjmqfne4rckc26b@doltdoltdolt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260331201105.xxjmqfne4rckc26b@doltdoltdolt>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 01, 2026 at 04:11:05AM +0800, Zorro Lang wrote:
 > On Tue, Mar 24, 2026 at 10:53:01PM -0700, Christoph Hellwig wrote: > >
 On Tue, Mar 24, 2026 at 10:56:55AM +0800, Chao Yu wrote: > > > This [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1w7ovv-0000JJ-EH
Subject: Re: [f2fs-dev] [PATCH] common/rc: support f2fs in
 _require_fanotify_ioerrors()
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
Cc: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:zlang@redhat.com,m:zlang@kernel.org,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid]
X-Rspamd-Queue-Id: 52A163751E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 04:11:05AM +0800, Zorro Lang wrote:
> On Tue, Mar 24, 2026 at 10:53:01PM -0700, Christoph Hellwig wrote:
> > On Tue, Mar 24, 2026 at 10:56:55AM +0800, Chao Yu wrote:
> > > This patch allows to run generic/791 on f2fs.
> > 
> > When was this introduced?  This doesn't currently exist in mainline,
> 
> Hi Christoph,
> 
> g/791 and _require_fanotify_ioerrors was introduced in v2026.03.20.

I mean the f2fs kernel support, sorry.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
