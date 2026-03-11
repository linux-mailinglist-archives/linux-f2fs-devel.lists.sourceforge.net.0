Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8J++AdVUsWlHtwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 12:41:09 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43930263070
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 12:41:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaSIpoykobXMx4MFsqDxvA4GWxk3MivZ7tysdFXu+A0=; b=TQgl6reItReV9CpVZjq004a+e4
	B2HJPaxXxhI7Iy9TsrzBynj1K0IA/2WF4LCfoEvYSjciysdbj0i3DNYF1p+11OvScIJuVg/agQvSp
	VQv/81hyevudvTe5jExZYo/qritUQojWs1SUwxK3f3nLoyWk5VvHlLo891mtSUbUPRsc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0Hvy-0000MD-GI;
	Wed, 11 Mar 2026 11:41:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1w0Hvw-0000Lx-BI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 11:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hghvzVba1q/xAQn2tH8MfPNoAAIYmfTOne/cK1QhKyo=; b=g4tp0wDi44JlEikm20x58BFGyb
 Pqz4v3EX1keHmFzGapxqYTVyFuiH8mzHE3P0Jepk9msl/r+tc+whZ8n5SLKAtWzFQctGjvQdEFKwU
 6yHNQTKs/LXYCFi4yv0Nj38cM0TizEbm5LdH5ZYysTek+7bOreK6EtnakizUi5iX8ayQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hghvzVba1q/xAQn2tH8MfPNoAAIYmfTOne/cK1QhKyo=; b=alKF6Ai47BQqx9DJrtZCVCuBCV
 NxuIn06fAvuzZxPM1AUMgjC7ViMgVu291VA6YW2jiUogobvXdO3oRNEJTBJN2GHdv2ROTH4T54joU
 SUp1c8DWI2aMir5QiH6e4xl8DLk/7Zu5XabF6XD1eXDNWtmF/3HdYFWitsPCA5S+w+Rc=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0Hvv-0000E7-NI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 11:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773229248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hghvzVba1q/xAQn2tH8MfPNoAAIYmfTOne/cK1QhKyo=;
 b=JPxldiaAezuIdMZKc5FA8pyHzrazYiIEcDXAKHki8Ekxa3oIowJuqy4ar1bkfD6KUB8o6W
 I1kybWT7TyX9JFKSJo/8DhOEEKxtjDkC6ZEups+On7QLGw7f9UYfFm9tLvDW94axHqZ2g9
 rvq1W25zuRdrA+2uIBifs1oKLKaivQY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-HLcrtHmiNhueS8Ya37JVrQ-1; Wed, 11 Mar 2026 07:40:47 -0400
X-MC-Unique: HLcrtHmiNhueS8Ya37JVrQ-1
X-Mimecast-MFC-AGG-ID: HLcrtHmiNhueS8Ya37JVrQ_1773229246
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4852cf0318dso47078945e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Mar 2026 04:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773229246; x=1773834046;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hghvzVba1q/xAQn2tH8MfPNoAAIYmfTOne/cK1QhKyo=;
 b=Yugl/GsWnu75XH0VEEOnz5xsw1H0VEvxepR/3wx+YdJ9i0H+2c556VP5cWbaUmCwRR
 LrwJ0IeMUlvnRg2nsSGNPv9CP7D3U10NKZP7CnHsicl/7LjMN0ENcWFuzC9hhGXvjN6G
 w/onMfKAQGCL+kls6FdOPeM897sqeXBFxUZ5sq2mTvJsxq25QZKJgWj7hK1zWZwyfpID
 V97/HeOP023xPpMs111N7t1cCDq6MDJ1rIhZzR+AP+JRezFUjD6ChAIACXhwfsbh7uzA
 IFjqxI9YQMnjG4QbyOJ5D7s2LdHuvN7X+FKibKZZxmwibkfg1AvrW/r7sePww8tMaTHF
 yRzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKorn4Ye6ZvJJqBgZQHMFE8ZQTrPsLudkijlX4Bav6gJQGUuUmyGTPU9rBc+EYFTplY1hsmfolNRwzFq0d2BOJ@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy6sUjW9A2P2F19SQ7d5ASL0DsUFjQ6O/uU5/BsWGQIirkK0Upy
 AMzaeYSbRtNeT0utNAfZoBdInlSI0B9T20RvR3ZJomGS2LXWO8jGHYCm849QrhO0hEB+DAKxc7E
 nYjHXb4PMm5eRmvqtPl1wKdbXIClyBQF84RRWWhKtmFWZp0utwrY912MjsN7wGHVGyLDh34t4L3
 DBnw==
X-Gm-Gg: ATEYQzyL3uQwERs7wEkSgPmnSddn8VrPfMDh3O+M1z/sEqBuTmgLAiy8ME06psbI0+y
 eqAcQEXIrFZoYfERjJSjhc09CUOwpSGgAJw2kPFZVTznlMoOFIZh+zyoFcJS0twK2PBhP8m+FeZ
 xa1wp8dlunl3Fk8pAllnlzT9pJC4aeAW1cjF+kHBz6QEuS/h6NWeL7zH/xjEkshqFXbhyiM89j9
 6DSyjQazs2DHIZEnYdKdEcXKeRrUoxJUy34AJAKca5Py5WVwtq2wuNXtF8BCTYeJYM2rvInCfdX
 +zSkbwRigIYJ+kDnS/l7o9ulj4/eLr0LzsDuTYcbQ3nt/gVgmi5jMM9jOGaIyP65tBg8BbhAgmb
 I9L1CX0mEeyo=
X-Received: by 2002:a05:600c:a08:b0:485:4388:3492 with SMTP id
 5b1f17b1804b1-4854b0b2979mr36839625e9.11.1773229246042; 
 Wed, 11 Mar 2026 04:40:46 -0700 (PDT)
X-Received: by 2002:a05:600c:a08:b0:485:4388:3492 with SMTP id
 5b1f17b1804b1-4854b0b2979mr36839045e9.11.1773229245499; 
 Wed, 11 Mar 2026 04:40:45 -0700 (PDT)
Received: from thinky ([217.30.74.39]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f818d61esm6551972f8f.8.2026.03.11.04.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 04:40:45 -0700 (PDT)
Date: Wed, 11 Mar 2026 12:40:44 +0100
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <bjvosviztvgxswil77pbhw6227y3qss7govt74iyduhfoo7biu@uifmquvn67vj>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-18-aalbersh@kernel.org>
 <20260310012105.GE1105363@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20260310012105.GE1105363@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qq8MYotPCX-bWDYftMUqM2SQX42T8GVydkR-3Nsj-OU_1773229246
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-03-09 18:21:05,
 Darrick J. Wong wrote: > > > > spin_lock_irqsave(&ip->i_ioend_lock, 
 flags); > > - if (list_empty(&ip->i_ioend_list)) > > -
 WARN_ON_ONCE(!queue_work(mp->m_unwritten_workqueue, > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0Hvv-0000E7-NI
Subject: Re: [f2fs-dev] [PATCH v4 17/25] xfs: use read ioend for fsverity
 data verification
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 Andrey Albershteyn <aalbersh@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 43930263070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On 2026-03-09 18:21:05, Darrick J. Wong wrote:
> >  
> >  	spin_lock_irqsave(&ip->i_ioend_lock, flags);
> > -	if (list_empty(&ip->i_ioend_list))
> > -		WARN_ON_ONCE(!queue_work(mp->m_unwritten_workqueue,
> > +	if (list_empty(&ip->i_ioend_list)) {
> > +		if (IS_ENABLED(CONFIG_FS_VERITY) && ioend->io_vi &&
> > +		    ioend->io_offset < xfs_fsverity_metadata_offset(ip))
> > +			fsverity_enqueue_verify_work(&ip->i_ioend_work);
> 
> I think the fsverity metadata (merkle tree & descriptor) don't need any
> (read) ioend completion work since all we're doing is reading that into
> the pagecache and eventually fsverity will go look at those contents
> when it wants to verify some actual file data, right?

Yes, metadata don't need any verification. We skip it here and
enqueue only data (this check):

+		    ioend->io_offset < xfs_fsverity_metadata_offset(ip))

The metadata goes through normal read path ioend completion.

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
