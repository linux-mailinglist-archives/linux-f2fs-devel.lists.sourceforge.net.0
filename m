Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPB7FdL7p2mvnAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 10:30:58 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8FB1FD992
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 10:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6Gk0+qv/Yubq0iZYbM/JWJ8FcVwquevvNed17JmTdU=; b=DqVmPsH/GSN1MJwbs/r7+v7as9
	0asD4Uh6JuKVJ1nba6IPx9bhBaH7bkOnBCVp//wvBY6YtGNAKloAaYct8Z/gcOuve4jAhxJs0v8hK
	WxRuGn72gzfALElBHpDosTCpIe16ekyiKJlNyVqU+Nrb3ciFLuv23Zdb/UZU0CxkMQRo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxiZ6-0007KP-Uc;
	Wed, 04 Mar 2026 09:30:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david.laight.linux@gmail.com>) id 1vxiZ5-0007KC-J3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 09:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BUzQoESoh9/PqMSFbMpuw4Pmh5IPXiGP/qvOjxX4wwo=; b=EFRrGgDJ4okXalm9eTrbj7kbc3
 p/3Rpy7aQVWAmgZQrvuDCbmzPPBzcHL2Lx1mtTYcsT1JwiF5FhEB2rGIL374fG8USdmz2oEVHkylL
 UUcFEekLTgP6QZayfK0CewQCSRpeNNW2qTg+mI9n6jeEZZGVLkkXwWAYAfUzl9baP84o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BUzQoESoh9/PqMSFbMpuw4Pmh5IPXiGP/qvOjxX4wwo=; b=jEP9HACvsEwoGgQmQAYNp8g1tm
 VOZLh62Oxos9sMd1sRg9lRe8H+BBeMZsafJTJepdULn04iWBPTynROJe14itH+QZWAEH3UeIosWQZ
 hxXoEudKB/EutTeoBLez+U1IHu0qfWNWvQ/t1Z9MpP+vtZKECe2FyNLPkpTRQFVyl7jQ=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vxiZ6-0007eV-01 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 09:30:48 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48371119eacso80386735e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Mar 2026 01:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772616636; x=1773221436; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BUzQoESoh9/PqMSFbMpuw4Pmh5IPXiGP/qvOjxX4wwo=;
 b=VAG2/OFjl2kHQw/xVwitdIOXKJvHGLOMIp9G5vUhpxYfvnnklNApZshY6wwcqPFQDT
 80mmpcXyFWGQFEkXxKNPCLnLrjSqrXJkgq3h2XVGF9Ra0pzI7FtmR78HIGmSc/MhfHlE
 OQZs2hFtMO1YwUU32qGqC5e1k7kwdAcySYgc7Sfl7jPcPKtCEJ6tLjcdRTSL6rrY6oi5
 dZRfy+2p8Rs6krdG7JIQvD+KoLRLEE/EZbjIVP6wvWbCHDw+G6weH02C0hUNd6L0r1wO
 +bcnSyK8t08xN/vHh4LV0wowHKNOfz/VyQoe+OMfVKw0ZjxXifLqFpK+R0Cb94cAw6Yt
 8Xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772616636; x=1773221436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BUzQoESoh9/PqMSFbMpuw4Pmh5IPXiGP/qvOjxX4wwo=;
 b=G564+bXKzuIgt2zR7KDTQMFCO3GF3XsUPocyxCAkfwnpiQ02BZbqDaSqBsfbhaLQqz
 +Qf25ygDcm+iFalmH0njkG3iYI1DLT/iKuDI/1/J3jYIP08wt9OxkorkI22shFTIEINW
 fZ4Six0ss+hBqt13PAsszVTJ6rOWtoHf9t+3A4+9T9ffUySesY1AvJQL1L9evPnTXaB0
 jL1vZqx4OxiVgPcIn11199nP9tB1LeB6G+XKvBDwrgA85VxxyGW1KsqPl9X/nfTHbaGX
 EMh85PLVOfIg+65Aa4AU7fMCHvwcyp7zqtlWgsBQiQhEDOSWjP7sUAwvcsuhxbiho8zA
 y9jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH75zm5EYgANElD68Sl5oAbtqtRFTw/ip5PoPFwhpbEIBsXjieM2R7NTlaT1st+cS11+NwGGvzY0r6wFG2UXJo@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyvjVFv8tH/OJljUAtYl9cb8GgxjUxP89HYdljZDjUmUnXFSDFH
 1/C6GqIvdb03SQ+FmuWiv+8wG833AKMHrf7hfxm+lMn76K48aVaW+1aU
X-Gm-Gg: ATEYQzzrAK6tdvVpQ1/cFdFHC1GByX+sFc68qxcSUl1RQaiFKV7WqjpyuIHEqQTWaXg
 hW6BJ2yaiAeT2OwDj63FxztKsJiKw2Z+puXJltFClZkCyiL3sfJY+DufJg3TCkcQtZQn16CaLQ3
 SipoKvyYmpQuCbnm4PJmF/cIvZZQxX5nQiYJAM7KHyyvoYGJur2P1FeBErBbCF+W4ilWArOF7lS
 LilOp1iAzNigENSN948NPOHW3Zi/qq3eiSj7cMXcSh3bDtfQT3kaDem71GqCgPwgFMu3+9+EgFe
 CoCKaJzcQ8O6wgVJV/MlrSLYNTY8Au9YyC0roOBfioBMzhPyVHdPnpxjqcfjKiQeuZQgBePU/Ml
 1kTQ8XPums+pu53Gyvi8vPq9Z8ev+oJSDUXMAQ44uyXAM4gNAR0Qijj3A9ZHGypXqB6CKiwD4NO
 92t+fM8OAhcIlk6XOzbC5SSZ0BS22IXi0NXbsv9PGbt7UhEZquFgIHyt858z1Ptjfj
X-Received: by 2002:a05:600c:8b53:b0:483:498f:7963 with SMTP id
 5b1f17b1804b1-4851989024emr19550785e9.26.1772616636117; 
 Wed, 04 Mar 2026 01:30:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851884225asm38972555e9.6.2026.03.04.01.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 01:30:35 -0800 (PST)
Date: Wed, 4 Mar 2026 09:30:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: NeilBrown <neilb@ownmail.net>
Message-ID: <20260304092559.554ac9a9@pumpkin>
In-Reply-To: <177260561903.7472.14075475865748618717@noble.neil.brown.name>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <1787281.1772535332@warthog.procyon.org.uk>
 <1c28e34c7167acf4e20c3e201476504135aa44e8.camel@kernel.org>
 <177260561903.7472.14075475865748618717@noble.neil.brown.name>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 04 Mar 2026 17:26:59 +1100 NeilBrown wrote: > On Tue,
 03 Mar 2026, Jeff Layton wrote: > > On Tue, 2026-03-03 at 10:55 +0000, David
 Howells wrote: > > > Jeff Layton wrote: > > > > > > > This version splits
 the change up to be more bisectable. [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [david.laight.linux(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.42 listed in wl.mailspike.net]
X-Headers-End: 1vxiZ6-0007eV-01
Subject: Re: [f2fs-dev] [PATCH v2 000/110] vfs: change inode->i_ino from
 unsigned long to u64
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
Cc: nvdimm@lists.linux.dev, jfs-discussion@lists.sourceforge.net,
 Jeff Layton <jlayton@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-x25@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, codalist@coda.cs.cmu.edu,
 linux-ext4@vger.kernel.org, bpf@vger.kernel.org, devel@lists.orangefs.org,
 linux-trace-kernel@vger.kernel.org, ecryptfs@vger.kernel.org,
 selinux@vger.kernel.org, autofs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-media@vger.kernel.org, linux-can@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, ocfs2-devel@lists.linux.dev,
 linux-fscrypt@vger.kernel.org, linux-hams@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 fsverity@lists.linux.dev, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, linux-integrity@vger.kernel.org, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: DE8FB1FD992
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neilb@ownmail.net,m:nvdimm@lists.linux.dev,m:jfs-discussion@lists.sourceforge.net,m:jlayton@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-unionfs@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-afs@lists.infradead.org,m:linux-cifs@vger.kernel.org,m:linux-nilfs@vger.kernel.org,m:linux-x25@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:codalist@coda.cs.cmu.edu,m:linux-ext4@vger.kernel.org,m:bpf@vger.kernel.org,m:devel@lists.orangefs.org,m:linux-trace-kernel@vger.kernel.org,m:ecryptfs@vger.kernel.org,m:selinux@vger.kernel.org,m:autofs@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-media@vger.kernel.org,m:linux-can@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ocfs2-devel@lists.linux.dev,m:linux-fscrypt@vger.kernel.org,m:linux-hams@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-nfs@vger.kern
 el.org,m:netdev@vger.kernel.org,m:v9fs@lists.linux.dev,m:samba-technical@lists.samba.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-perf-users@vger.kernel.org,m:audit@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-integrity@vger.kernel.org,m:ntfs3@lists.linux.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[ownmail.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[46];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TAGGED_FROM(0.00)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ownmail.net:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On Wed, 04 Mar 2026 17:26:59 +1100
NeilBrown <neilb@ownmail.net> wrote:

> On Tue, 03 Mar 2026, Jeff Layton wrote:
> > On Tue, 2026-03-03 at 10:55 +0000, David Howells wrote:  
> > > Jeff Layton <jlayton@kernel.org> wrote:
> > >   
> > > > This version splits the change up to be more bisectable. It first adds a
> > > > new kino_t typedef and a new "PRIino" macro to hold the width specifier
> > > > for format strings. The conversion is done, and then everything is
> > > > changed to remove the new macro and typedef.  
> > > 
> > > Why remove the typedef?  It might be better to keep it.
> > >   
> > 
> > Why? After this change, internel kernel inodes will be u64's -- full
> > stop. I don't see what the macro or typedef will buy us at that point.  
> 
> Implicit documentation?
> ktime_t is (now) always s64, but we still keep the typedef;
> 
> It would be cool if we could teach vsprintf to understand some new
> specifier to mean "kinode_t" or "ktime_t" etc.  But that would trigger
> gcc warnings.

A more interesting one would be something that made gcc re-write the
format with the correct 'length modifier' for the parameter.

That would save a lot of effort!

	David

> 
> NeilBrown
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
