Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMGrFmr2cWmvZwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 11:05:30 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B3964FA5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 11:05:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/MKIRXVPzE/O0zsqZaGcnVC63vkSoJ5ceXlCeWGywQ=; b=CPXtIsrDxmMJaTBCNMQeMOgQAo
	kWAiwbidY9EoBOTlQra0zv8Z+ugDJECN1CHXyLYr9Wgkz1F087gx7Eau/xE9e4mjhqBW8Vr3YY+/h
	2Z+Me10vmhKdtAFGH1tjlOnIfMGcJaG1rs1Frb+afHBw1gj8xEs+uwNWWOPJqZ1dydwI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1virZ4-0003RZ-Oi;
	Thu, 22 Jan 2026 10:05:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1virYv-0003RO-Tm
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 10:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YNqvczIVehNho1K6yzOe7LZ08YqMOyw0NvDlIw+P6AI=; b=PeIkBq6bg1sO3yLT+Xavc2xg2Y
 MM2CMJJg2DDwDr2Sn5AWdUQeThO58Uos9oLEm+atzaRDI990WCEgF4vm2w+KhJdVAvnHv3c5F8b0P
 LM+rMcdwRfXHB5mB9LfrMuGjIaYue7JaPHNo8Zk+waXxaYAn8mFor+kpiv/oftpyZcu4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YNqvczIVehNho1K6yzOe7LZ08YqMOyw0NvDlIw+P6AI=; b=gJGcpGa33BNL6fFJ8+FwNFVoXW
 kaXLel7XvipwTHkxfCgthFHYFp8m/P3d6xW+7RUqOJ2Cz7Nuu3rD2yr/NO1Ikkf1eqACMqNWP7QGa
 z3nMbqinbi3twD6jiJpPpQC+yOXiKa7Uqlx0acCw9Moom/GJpWWg9zJVqeuF2UtpvqTs=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1virYv-0004yH-GJ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 10:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769076307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YNqvczIVehNho1K6yzOe7LZ08YqMOyw0NvDlIw+P6AI=;
 b=XWf8CMi72NELo3h9CCYJe6airjNy8gH8lzXJiSPqO2Sh9VCBzFGjLHnMlNPSrhLXWFD72g
 bWbC11vmPKUscRUifPz8mF88PrwdRv5Dp5IvyfeOzjRc9cu2b4fdQkEJkQj3OOlQQWYoBx
 HrZrVhkuGWAoru6QNh5ddV/Fcw7pY0s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-kZ-70uEnPfeENPOUeC3L-A-1; Thu, 22 Jan 2026 05:05:06 -0500
X-MC-Unique: kZ-70uEnPfeENPOUeC3L-A-1
X-Mimecast-MFC-AGG-ID: kZ-70uEnPfeENPOUeC3L-A_1769076305
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-477cf25ceccso7112155e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jan 2026 02:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769076304; x=1769681104;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YNqvczIVehNho1K6yzOe7LZ08YqMOyw0NvDlIw+P6AI=;
 b=dvUFe+R5yc729DKTisdWhtgkgTZB2IjV//vu5ZZ2aSLG6lp4p4z8xqaxtywFIQfKhf
 f13L3hu645MBuRs3wBKv/rIiFae+/80aSusV2tz/I/BM2cyVlsO+TWLUAuoaoR+vD8uT
 lvygpkMpdhvAFLtJC3oLdvUKLImhbZVt05e+ZKYOnp3NQ4DOiyxGQKloypkdZTAVeKfl
 hpHMDgQydewZPeWCTxtd2UhHe45G1Ly1Pie60rxF4zF02ctTMyqCxCtJ6MP8RDOcSW6L
 m4ryVmO1L/3eGfRCMSeoXD3rHfIrlGO/VOxaOFKl7XV0+8HJ6Y5GltEvEyiG9KrbiW7Z
 kRag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqlsUn6INBdXk4aRiXxJ2o/cBYcli3KA6U1WiU39BWGYWqJa6XLpNPATGdF+C8dcItIOnTGdJcJz2jnuW8zD1m@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwKqJG33wYSVoMLMElBqa4xV5QDmAXLbgV5EiNb7y02MH2ngdgP
 qoU5YZ64snjIwYDrhK6Hbz3q88wj3P6nVdvxHYX5CEH352583TllZ9aQ/8SLIr9EK83cSsgR1sK
 rb/OhgcloWHgFikcn6Q9QGUFKZJaC35UtnteKBLN8q9zsUJ1BkWyGIMZ1s7uHb/eNyqAU9A4QP9
 jJBm06+OMvlQ==
X-Gm-Gg: AZuq6aLP0hNuqPcPm9ltY7D7ythDfB8y1Uixa5aMKW0hxcnkADBDmv80xT85sENQgfL
 GW5vyHrQI0rMIRRXZbmdagkTwjurKvwaYxoy6Myc0jfE5D826VxulW5TeZDTNEiN/BgU3LvqGTz
 QMbnKiay9bL5SaST1a2KQdIpqATVhnH6AvWZ6NbCZAHMluaHxaw2wv/WfkJLnACo/HEu4dUkxaO
 vmHI02cncPYRe359g6fGRvl0LE41YiFT2NJX4igVPrL0HHOfVfZz0w/fyvP+8MgCEPMVNKQgA70
 8Gdb8K3PFGHJcqhSBMM1GxU7Uqt96x+4/BdjgF5C38gCOusT52htZ2m2NMvV6o4wjV7pfciN0lo
 =
X-Received: by 2002:a05:600c:1388:b0:477:a36f:1a57 with SMTP id
 5b1f17b1804b1-480409ca767mr113935975e9.3.1769076304296; 
 Thu, 22 Jan 2026 02:05:04 -0800 (PST)
X-Received: by 2002:a05:600c:1388:b0:477:a36f:1a57 with SMTP id
 5b1f17b1804b1-480409ca767mr113935225e9.3.1769076303635; 
 Thu, 22 Jan 2026 02:05:03 -0800 (PST)
Received: from thinky ([217.30.74.39]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804704087asm53174235e9.6.2026.01.22.02.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 02:05:03 -0800 (PST)
Date: Thu, 22 Jan 2026 11:04:32 +0100
To: Christoph Hellwig <hch@lst.de>
Message-ID: <2i3y4kybtm2lusa7eoutefawgrkhoqhuyquilu3qvkziyhpbvf@jeyk27glmeyg>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20260122082214.452153-4-hch@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qREQ4y5zt1HUGUECQEAS25DmlUIbatp90UVgV5vi_Y4_1769076305
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-01-22 09:21:59, Christoph Hellwig wrote: > This will
 make an iomap implementation of the method easier. > > Signed-off-by:
 Christoph
 Hellwig <hch@lst.de> looks good to me Reviewed-by: Andrey Albershteyn
 <aalbersh@redhat.com>
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1virYv-0004yH-GJ
Subject: Re: [f2fs-dev] [PATCH 03/11] fsverity: pass struct file to
 ->write_merkle_tree_block
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 74B3964FA5
X-Rspamd-Action: no action

On 2026-01-22 09:21:59, Christoph Hellwig wrote:
> This will make an iomap implementation of the method easier.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

looks good to me
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
