Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAetBin6w2klvQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 16:07:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2AE327879
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 16:07:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DspW39nyJH2GCH4zOrdcSFA+FQqg+4As4OG3dWc5x0=; b=Ex5bpC3G/C71YHuHJrgWpsqndQ
	smA8oiKLd42yIfPwzeXDljmPJu374Y9xtnYPesCgBYsciapb1/cnExDSUiH7bEhAvW1y23186F7H/
	TGuvcezcvFpZ5E0qE6FkqC9WkjZlJqNtRyD05G5n0zG+g0qmPrrUbH4hi3kAXUGil0QE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w5PpB-0007OR-Ug;
	Wed, 25 Mar 2026 15:07:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1w5PpA-0007OF-H7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 15:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hHtDuEkZI5nETEV2K61pi5NwMLau14IczzFE7YDeBkk=; b=VqaR8zDuIDp4exb8mOfx1i1re4
 ttj8Fdn8wc5SfB9zagUfFbcFVL7XK7OGCBh3CfmqMx3gH5O61Iq3R+7J3bTg063YyZG8FIrWg+aah
 9ANwiDEr3VNt5Ts3f4RmgJDIUOhaUGba/TIEfhuj3VMzInP1piQmraeAjwOR9fRvrfT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hHtDuEkZI5nETEV2K61pi5NwMLau14IczzFE7YDeBkk=; b=jbUg58LD6z+vOwml4F2qWRy1nw
 aQeWSxhN+uRzgFsk/lvHw/NUVsMYoqzUOUEzkzVRVFYkesSuUL5GjjB+psdIGt4G2ZFidD5MVsFF2
 jlpEk17UjQ/Nrg8KCw3JJWSONqGENSqlIIc+rBmbA6aii6ZdGVKWq99LVkmA0X+/tchI=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w5PpA-0006yh-M5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 15:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774451226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hHtDuEkZI5nETEV2K61pi5NwMLau14IczzFE7YDeBkk=;
 b=JFq0J+L4SfLJrlbTbf50saSDWkCkejnx1yZV7Ddp7HSENVwmyKSHmgM1mdqHMb+EXFsdFr
 cY6FuBgWA9Fo2FgO2Zl7xhXFNHju+4UnUePn/AN8rwhOuqNNFCfBLuJ56LsiPshKotO+uN
 ZVcWUnVuA031Okvmd0uiomQU8Ewxn6A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-XsRIPR11MRCGE1PM_vq17Q-1; Wed, 25 Mar 2026 08:03:45 -0400
X-MC-Unique: XsRIPR11MRCGE1PM_vq17Q-1
X-Mimecast-MFC-AGG-ID: XsRIPR11MRCGE1PM_vq17Q_1774440224
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b97d773ea61so197833866b.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Mar 2026 05:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774440224; x=1775045024;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHtDuEkZI5nETEV2K61pi5NwMLau14IczzFE7YDeBkk=;
 b=LTw0PQfJMTlID4/7YI5yY1KgwZ3K2ZSEcc8Uw2fEYTpKiPX4KKFBRU2XI2gFMKpulN
 EVyteu1f4MVkziFuViFfJDL2ISjwDTPrie4fX4GhPqXWmkqy2d2AjP7bCkmlM94lTVbu
 0WieYLa0d5okokfLFkAciz8fRih63k2P77zw8ZkWnMRlllmh11xXEZDdNDka+ajDCwN4
 Igjdw5Nss18ur2LiMJg/lXfu6kwanEvqq2Q932QFsWcky6UHsExIxrFKvlunuBgMm1iO
 sGPrRpVuIgIiJ+SMxZDk0aB/IUMvTlaJgFANLJFeuJh+6QVgla0xNpEUBfK1y300IvGR
 vBOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWSLz3vcZCva4Qj3VVGdJpXECNAckX8BRZwyscBnFiyrQMNc6rME2FTpS5J/iRHUauZQS8bRLEI1O9BrN+5AU/@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz4S4edzcd+Fty4S3U43JChXy5cCv8pc+IhhwB00iaWglwthcwt
 ANQ+dJQDf8jUl1g7Ph2nJa2PnxHd3aUHEAocjbRCfLKMIz4OwrLecgV5z9p0gR6E19kjYTlfDIx
 bJhCFKgbnM/sjUKmWD6aVzZgVLthj3x8/mZXCIt2ccg7tXOU3HVpZ6Hi+BpQkYyFwSH1vn96RrW
 vSEQ==
X-Gm-Gg: ATEYQzw77wsBdOXobOOLJW4JLGIYFeEwuOfqhdvCQAmTHmzQ8ov30xR7sSPB0njB8qZ
 PTGSZwXIZhhbC7y9XfAFHx+0c1dRHpj2aSo8vByn2QWvQ/gNvBWMaO2rISQ/sjuchX13l+qTh2w
 cMjDT0omyc8sA1W3p+ExTbds/IErLlSbNhk3IBpOSRcYyAgqCrReD2LM8DYgjIHdtC0mH3etPGo
 n1e31PJ8uAzt4kf2ysTXaLtHW2o5XTe0XyPhHe86cJMhjc97QbPdkU0gTfMJZzGN6jhzMU/ZdRf
 0ZtKaoKdy5WgO3SmjFa/7KnK8wkkdL0ign/GcthaW35bEgwXesQF6cJDjncYxh2L0HocXEQWtG5
 fCRiCUBo3nsEQzw==
X-Received: by 2002:a17:907:3ea5:b0:b96:ff4f:11ea with SMTP id
 a640c23a62f3a-b9a542834b3mr225196166b.41.1774440224226; 
 Wed, 25 Mar 2026 05:03:44 -0700 (PDT)
X-Received: by 2002:a17:907:3ea5:b0:b96:ff4f:11ea with SMTP id
 a640c23a62f3a-b9a542834b3mr225190866b.41.1774440223277; 
 Wed, 25 Mar 2026 05:03:43 -0700 (PDT)
Received: from thinky ([91.245.205.131]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b983365a159sm760453666b.44.2026.03.25.05.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 05:03:42 -0700 (PDT)
Date: Wed, 25 Mar 2026 13:03:40 +0100
To: Christoph Hellwig <hch@lst.de>
Message-ID: <vatqzcvepp7z6iotzayuyh7fajwdqs76pn4o3sdn3f5thiwsjc@dt46ylrbjnkp>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
 <20260319170231.1455553-4-aalbersh@kernel.org>
 <20260325075700.GC952@lst.de>
MIME-Version: 1.0
In-Reply-To: <20260325075700.GC952@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YVGoQ8zCJmX0E94PBnvKiBSCvu6YjYsqhSp8wOCTc6Y_1774440224
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-03-25 08:57:00, Christoph Hellwig wrote: > Shouldn't
 we still try to get this out of the fsverity_info first? I don't really
 understand
 why, this hash depends on salt (inode specific) and merkle tree block size
 (also inode specific). 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w5PpA-0006yh-M5
Subject: Re: [f2fs-dev] [PATCH v5 03/25] fsverity: generate and store
 zero-block hash
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
 Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com]
X-Rspamd-Queue-Id: 3F2AE327879
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-25 08:57:00, Christoph Hellwig wrote:
> Shouldn't we still try to get this out of the fsverity_info first?

I don't really understand why, this hash depends on salt (inode
specific) and merkle tree block size (also inode specific).

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
