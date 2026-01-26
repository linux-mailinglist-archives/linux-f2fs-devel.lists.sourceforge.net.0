Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPFeOzn0dmkzZgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:57:29 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3E884120
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:57:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFmy4qgvKdYZLKZ9Hdvo0yBRUUlV+TDjLMmML6XmhiU=; b=kaEMIaOlBdPvIMddogAJWGUv4v
	4yYHH0wFZHwcFOd5a3+O6zt8Mt5rmC97DIQMJgkFAYlf6JxHeFM1/tqWgBnYdCuSHXSOE+/DSXi3O
	qAwbQz+IU17epaZJOjJ1X9I7ZvH3vBjV59mQ9WbxWB9CKelEtIf9V64riz/hiKrGm6Y8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkEfG-0002Bj-Na;
	Mon, 26 Jan 2026 04:57:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vkEfF-0002Bd-7q
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CwxH6H2CfkT8iMZqvJXDnqSuSDUBr+iSR8mDT1/rG18=; b=j0/tBnUme2cMLPP52kVLr9CM7h
 aqSGpm3gIs1YCrX5vb6JXHGB0IRxlrelR4WpzD47+k/BbfKnLZ+cgjCv7AKWZjEmoU7oocqPal/V5
 TDldpOzW8BHQBQ4+SphYTSvEDQgCnuzm4Z05DgaPb6evyxB2sjigDoCFvyJxEouf4zNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CwxH6H2CfkT8iMZqvJXDnqSuSDUBr+iSR8mDT1/rG18=; b=b6whU8Yym1fMzkqVCbBwsxL5Zv
 fEt+K/3fKhJ+b3jOMll+wgirPHhMKyreeX5dsWFkPyEeWXeMnXSIRh08yi4DVe18/1bN4Xu54FCpx
 3SGURKT6Yn3B2FtY/TL+Fp3lPXfX/jMGHpU5KMDM1P30Li7Ms61ibaz/0QB3OxaUVeYA=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkEfE-0002EC-Nq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:57:25 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id F3EC3227A88; Mon, 26 Jan 2026 05:57:16 +0100 (CET)
Date: Mon, 26 Jan 2026 05:57:16 +0100
From: "hch@lst.de" <hch@lst.de>
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Message-ID: <20260126045716.GA31683@lst.de>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-5-ckulkarnilinux@gmail.com>
 <942ad29c-cff3-458f-b175-0111de821970@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <942ad29c-cff3-458f-b175-0111de821970@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 24, 2026 at 09:35:16PM +0000, Chaitanya Kulkarni
 wrote: > On 11/24/25 15:48,
 Chaitanya Kulkarni wrote: > > __blkdev_issue_discard()
 always returns 0, making the error checking > > in nvmet [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vkEfE-0002EC-Nq
Subject: Re: [f2fs-dev] [PATCH V3 4/6] nvmet: ignore discard return value
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
Cc: "cem@kernel.org" <cem@kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "song@kernel.org" <song@kernel.org>, "hch@lst.de" <hch@lst.de>,
 "agk@redhat.com" <agk@redhat.com>, "sagi@grimberg.me" <sagi@grimberg.me>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "snitzer@kernel.org" <snitzer@kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "mpatocka@redhat.com" <mpatocka@redhat.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "yukuai@fnnas.com" <yukuai@fnnas.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	FROM_DN_EQ_ADDR(1.00)[];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chaitanyak@nvidia.com,m:cem@kernel.org,m:linux-nvme@lists.infradead.org,m:song@kernel.org,m:hch@lst.de,m:agk@redhat.com,m:sagi@grimberg.me,m:ckulkarnilinux@gmail.com,m:dm-devel@lists.linux.dev,m:snitzer@kernel.org,m:linux-raid@vger.kernel.org,m:mpatocka@redhat.com,m:jaegeuk@kernel.org,m:yukuai@fnnas.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:martin.petersen@oracle.com,m:johannes.thumshirn@wdc.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:bpf@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.infradead.org,lst.de,redhat.com,grimberg.me,gmail.com,lists.linux.dev,vger.kernel.org,fnnas.com,kernel.dk,oracle.com,wdc.com,lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	NEURAL_HAM(-0.00)[-0.993];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,lst.de:mid,lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 9C3E884120
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 09:35:16PM +0000, Chaitanya Kulkarni wrote:
> On 11/24/25 15:48, Chaitanya Kulkarni wrote:
> > __blkdev_issue_discard() always returns 0, making the error checking
> > in nvmet_bdev_discard_range() dead code.
> >
> > Kill the function nvmet_bdev_discard_range() and call
> > __blkdev_issue_discard() directly from nvmet_bdev_execute_discard(),
> > since no error handling is needed anymore for __blkdev_issue_discard()
> > call.
> >
> > Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> > Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
> > ---
> 
> Gentle ping on this, can we apply this patch ?

Are we down to three patches now?  Maybe resend the whole series and
get ACKs to merge everything through the block layer?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
