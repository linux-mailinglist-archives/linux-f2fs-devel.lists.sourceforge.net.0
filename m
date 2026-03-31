Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMSPAHQqzGkmQgYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Mar 2026 22:11:32 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 448E9371095
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Mar 2026 22:11:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wf3DM0RQ8GNnC4xEA2K8QWsX5mzPMCPQBjvhmwmMZ7Y=; b=bSlK7UTmIPW+W0BVuCXN8IYuIP
	/LiDthO2ZJJ8BIFMz9bmSIzmyLTu1woogjyk11lVfmNrdpMm8nFUDh7vW5FZ3syJaA07Wv61Hiyr8
	OoPB2TjaWkUJmAo2W0JOmrxTc/RvenG2IMnsfqQ9EgVdzF5FtKgu7hTUA8jYcqqNr5W0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w7fQq-0004xP-4e;
	Tue, 31 Mar 2026 20:11:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1w7fQo-0004xH-Ro
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Mar 2026 20:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bi7WCOV+a0S3JMe/Pc/c/xn4EF1RwytjfIN5ej3N9WQ=; b=INOxYOU3RiGBXcRicIjC59jkoA
 HmO9tEF4E+W+pv4bBI0Nor6h+bj5tNdhwjwKorSZ9LJumwWjUV9v2J7Q+mCEEMLefgBArGdHYLAtz
 6U5/sNY3MZE58+uycP67NlOTe1A1cAjL+RNQ/YE8eY9GNOn++PHiIzs9EYnv7gQx/umk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bi7WCOV+a0S3JMe/Pc/c/xn4EF1RwytjfIN5ej3N9WQ=; b=BH8uoSLGCrK/WxL4o+dO6n6vDn
 2UDoJePW9VttC7aVP2HWuXG7PPeaKhQeHgAISO/vF0PrutLtG13uSpT7gsnT+D+mJheWCaiv3cM4V
 yci2YK/w974eq5PAGddYxXgq8HjieCkZJ35NDW60MFAUeAONgHsVCAIL6d2EeclcdmJg=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w7fQo-00046S-ED for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Mar 2026 20:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774987876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bi7WCOV+a0S3JMe/Pc/c/xn4EF1RwytjfIN5ej3N9WQ=;
 b=L/nimMrrGplBNOpKcdmP904ctfA0PPwn2dc4CegLwHGpgHs/MgQwoyzMZZ1IPy5iVimytp
 Z1oqcLgtwweAhlYm02r1sNx6hlkJYE1NluwnpF/Sq8bxT5TP+GS4CyHFV1HmrPyQ6MLfE5
 2Jpw2PljhMGqP8rfDe2A9AlpIRScGuw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-6hrHkGdcNPyohEWzKf5yRg-1; Tue, 31 Mar 2026 16:11:12 -0400
X-MC-Unique: 6hrHkGdcNPyohEWzKf5yRg-1
X-Mimecast-MFC-AGG-ID: 6hrHkGdcNPyohEWzKf5yRg_1774987872
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2b24af7ca99so38021165ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 Mar 2026 13:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774987872; x=1775592672;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bi7WCOV+a0S3JMe/Pc/c/xn4EF1RwytjfIN5ej3N9WQ=;
 b=N6y4V1+vS7qotAXi5Ld+5hmOoA35U/6YrshGU+35pyrD0TsoIhOULPZcdFDMOy1yEA
 K8sIOeznDrAN++2Tw6hNmugiKmEm4ew9+8d7K7KZrnWvQlEyyF3iPtSrt2Hq/EMRHHpb
 GCM88oY6z8f2Hp2iwsrsHpxqKvokgYjWKifjFCAYghXY+AMLLshCxcq7DFEuwpah1sGV
 Sz+KqEIgWRKsOJRv7G92DA78U2R5uyejOG4//VI92tlGb/ryWqi8USNk5JnHZrsAEzTV
 HzJ5W4OgBU6YLoFSdHyYBMPhEynDNWo/kJYyQEPrJdWAab3ez4nGZSyyLthfIZ5We29z
 aX5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmNAlWPx8rDliY4Gd5lkj3Awn09ZLoa8FCj8qQrTPO/EBHegooaryqqP1Cr70jqMpuXT3FeeoCQKZMT//j/urP@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy7ibxeQ12+WY2OW/FyjSudu2NDo94dUX4Adx8uAgpVpu5UUXVa
 Ztw6oFfDBDBJ4INtkLxKuR05e4jSuL8DN8iHWMNT/hHgmWw5KRjBq0xOUucNgCqjNxvb3Ru0wXp
 SbAYXzC3KsF3RlRjKO2pa1sz4id/gnmpH9uz5pVBKsLBSZD90/U3bUDOVZTPntMEdcGOfPowMN7
 V8hs0=
X-Gm-Gg: ATEYQzxamWd1ouHL4ziJec0dvs7zGgwpfzvnr99oU8/EJkzaNp44XldhfkcF5rDm8gR
 20dJ3i9AeWeImg8ZLJkdZzdSpTHcKv8nichcY/qlYzB6zlJBhzL2PMo3zCiGryiMkO6HVKLW7zq
 FXnQmHpqeTQ3JAGc6dCi8OA+MwL0+t6rBiw6/Zmucm42RrrCRcW2aRLb3V+Cc8DTbIKWjzq0jGD
 ZRsVLIBJa9bl5s9qgABZGhsY0PftogztZu6ysw4PNXvSs0Z+3ZZfWWCEI9EIRAUjcMD2wcCv0LU
 pFCbXjq5QiAE84K67l9LZjPnpNKC0O4DFL98DFSd4EAyt3FOHLSFYAwzFnrwWcXMFFyCjid4/qD
 0pc53axyTAVtZuXkhAA==
X-Received: by 2002:a17:902:ef06:b0:2ae:803e:6c0d with SMTP id
 d9443c01a7336-2b269ad16camr4920525ad.19.1774987871571; 
 Tue, 31 Mar 2026 13:11:11 -0700 (PDT)
X-Received: by 2002:a17:902:ef06:b0:2ae:803e:6c0d with SMTP id
 d9443c01a7336-2b269ad16camr4920415ad.19.1774987871115; 
 Tue, 31 Mar 2026 13:11:11 -0700 (PDT)
Received: from doltdoltdolt ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2427c3a4esm155054955ad.78.2026.03.31.13.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 13:11:10 -0700 (PDT)
Date: Wed, 1 Apr 2026 04:11:05 +0800
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20260331201105.xxjmqfne4rckc26b@doltdoltdolt>
References: <20260324025656.493776-1-chao@kernel.org>
 <acN4PWKHvk_33VB7@infradead.org>
MIME-Version: 1.0
In-Reply-To: <acN4PWKHvk_33VB7@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xOB_GgAyOGwelysFVGIOYFhK-L7F22WzkKANNY0HuFA_1774987872
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 24, 2026 at 10:53:01PM -0700, Christoph Hellwig
 wrote: > On Tue, Mar 24, 2026 at 10:56:55AM +0800, Chao Yu wrote: > > This
 patch allows to run generic/791 on f2fs. > > When was this introd [...] 
 Content analysis details:   (-0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w7fQo-00046S-ED
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
From: Zorro Lang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zorro Lang <zlang@redhat.com>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:jaegeuk@kernel.org,m:zlang@kernel.org,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[zlang@redhat.com]
X-Rspamd-Queue-Id: 448E9371095
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 10:53:01PM -0700, Christoph Hellwig wrote:
> On Tue, Mar 24, 2026 at 10:56:55AM +0800, Chao Yu wrote:
> > This patch allows to run generic/791 on f2fs.
> 
> When was this introduced?  This doesn't currently exist in mainline,

Hi Christoph,

g/791 and _require_fanotify_ioerrors was introduced in v2026.03.20.

Thanks,
Zorro

> and it would probably help to run your fserror implementation past
> Darrick and fsdevel for review.
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
