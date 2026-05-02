Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBD7HYJd9Wm+KgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 02 May 2026 04:12:18 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F15734B0A8D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 02 May 2026 04:12:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atSKwVmB0Ksgo8T10gWaIOpYpf0wV0L8qG43DVgezgg=; b=kTmDHD6zL5VYhwenyylDgM4x91
	joybZlCeP1cqMEApXeHpo/JxKSwMCUQGRzGScfWxDQ+O+qZjR5JMeeyFJ4LU+GT/YYhU18mx6KEOf
	T25HrgP+g5FT2I4A8Lq3FoOg7XTasWoGRatjhl1NJ4vWMlhs94C6hv7B47g3K3c+xZGQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wIzpu-00084I-PD;
	Sat, 02 May 2026 02:12:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zorro.lang@gmail.com>) id 1wIzpt-00084C-Fv
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 May 2026 02:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jEjq7D6SQbjq+dm80J2m8C0/q5ysRjrTj0T2q4jFV9Q=; b=mxZ0u3Mbl2DUvOnhwwevv5bXno
 wCO0bfo/BdXz0Mi47wTGIuxBCQ0tUan4/HK3Qu9Fpe+gDjMs2QJOF+WuBTHUpuMfVqrIhfCLlV6Gt
 PRIjhWhSAu/OHPph2/g9ipjfTO6GcnrItr21lhLD/QCeVAoWudsPuLnOx3SJAAsiSFd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :Date:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jEjq7D6SQbjq+dm80J2m8C0/q5ysRjrTj0T2q4jFV9Q=; b=Z8A8fGYHBpJGcQRokihYq3afmr
 kg4QSSQ7KVRoSW37GMMeEILmLakZfQkGrPaBFLG1lxNPGud21bsvJflLjfHWQDTr9e9God0CVVv16
 8C2H4OxbCf/nMcwsgp7Max707+lxjKLvOJB07P5zuSFF5fizqSosbFrULvGQ9HA6dOPw=;
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wIzpq-00013L-Gy for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 May 2026 02:12:02 +0000
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-364d72f2986so1533447a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 May 2026 19:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777687912; x=1778292712; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:date:from:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEjq7D6SQbjq+dm80J2m8C0/q5ysRjrTj0T2q4jFV9Q=;
 b=OsMIXGnxPdCjoeuJYkPfZV8q91mRr6yoebzcIXOZ9FTbosBsV5dT7GFyWkxvkgwyJf
 PKFWYVVOTHkVY0lgwRUmIzkKXAvbdXrExgu4mquCCjZX0TKhTOB1zm+X3+HU0qzpv+ur
 G9+w0tpFY4Tk/nTU2JEwUFdqsYlDN5Yi9G2D2KxclO8bQdnhNbbAa2mVAw3UAt/MPtrJ
 ndnG5eBdoxpOiLWiZmCW9ahgL3osazXa2bi7Bwy28AA70VEwPfxI2PI9u0ff1gGyYc9R
 pu5OxNd28oorQygwEOnZVg92st/Wh3yhniwDxeDkeBZWhhsCH7d6PahhwraHb+ys+Y/F
 mMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777687912; x=1778292712;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jEjq7D6SQbjq+dm80J2m8C0/q5ysRjrTj0T2q4jFV9Q=;
 b=m0YiOTenGusXRK8L9GjKk7WNAN/KBXjrn7dVXdAKHenxmB93fON5JyhYSoISPO/es5
 OnIBYbUWx8oix2g5t2pJCPKOw6/89j9st+JhFd5nnDYjJoLG74EscHSSOeXiL0DypPZO
 sqr4O1uWXFH1/gkwr4hdg3MKrWbrvenViMR2zj0wyuDkuKu3MOTLdgZiPXBH2s1D9VGw
 LLasYmiK6RTxU+tUbtx1iI2M5cmbvYncn5VLB7QfcqPE19b/V+bI+5KOol7z1aFOpWNy
 fH6zRhrmikO9XLIJUZVksuKSvpYE2MgEehdyDuOssna+gsuaL2vtIXvu4uS0a/8GWcCQ
 TY2w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Y4NTLR2uLqutjMpbuTg8JLiIlryi5cgUbKsNZfbcS5FSk7mDsUu8qTq3/7tER8EpE7dNJH0q7JzAdLVfkM2gf@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyoT64hjwjXhqe30hsd/p64ELEDGW3+qa4+ZCMazoEF7MjEKSgq
 EZPj51G2kidT0QLMPcxWdyfzM22ItuGToQiq0bofbRXD5CS2bBczwnC0
X-Gm-Gg: AeBDievgkCIDL4QV19WIrbCUqkJ18h2h3vP7ZudfDBmXbtzc68LQJoNGqRwbeVJQ0gV
 3uqv35Cv+bnkx690p4F8gxxwJeYDmp9ZBqZgAF+EKbJq8pFF1BW5+Tot7KZWpoxn4m+OgH1saVH
 7T8YrxsXPPtj/GKoHc9muhjeHZX3JigXaE+tdOw86kkjsaOA7QDo/VPSzH4I5fvEsIHfeGhEhVZ
 A327AkLYdqTwhnF73kmnVa9wTBiYWKTtFNItVC6XbZo9fctqSXRjwsTdgyBuiJnh6eHais8OZT9
 ibNj+c4B99CTLRf9hHzHnCScK445vWNCP0JPehOCvmwdWYTVsrNyOOWIfGfvwFDZ8q+SN9TCYh4
 wLLldx3JbW9U0KfXq+Evx382se8m9w3RVKEoM+z+qs/WPxoE3Ks3M8M6kh+Izy2PS27kkuK0f0H
 FIlsfAkzWt5balV/JHbi+DjljyKsQB3Pc=
X-Received: by 2002:a17:90b:2b45:b0:361:423d:2026 with SMTP id
 98e67ed59e1d1-3650cdbcabfmr1488200a91.12.1777687911702; 
 Fri, 01 May 2026 19:11:51 -0700 (PDT)
Received: from zlang-mailbox ([218.69.128.26])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-364ebd46484sm4877913a91.0.2026.05.01.19.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 19:11:51 -0700 (PDT)
From: Zorro Lang <zorro.lang@gmail.com>
X-Google-Original-From: Zorro Lang <zlang@kernel.org>
Date: Sat, 2 May 2026 10:11:45 +0800
To: Joanne Chang <joannechien@google.com>
Message-ID: <afVc-ZxMAKHCpQSR@zlang-mailbox>
Mail-Followup-To: Joanne Chang <joannechien@google.com>, 
 fstests@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Chao Yu <chao@kernel.org>
References: <20260428022440.2481342-1-joannechien@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428022440.2481342-1-joannechien@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 28, 2026 at 02:24:40AM +0000, Joanne Chang wrote:
 > Currently, f2fs/022 and f2fs/023 only clears MKFS_OPTIONS. This causes
 > the tests to fail when leftover MOUNT_OPTIONS depend on unappli [...] 
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zorro.lang(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.44 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wIzpq-00013L-Gy
Subject: Re: [f2fs-dev] [PATCH v1] f2fs/{022,
 023}: clear MOUNT_OPTIONS alongside MKFS_OPTIONS
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: F15734B0A8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joannechien@google.com,m:jaegeuk@kernel.org,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[zorrolang@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zorrolang@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

On Tue, Apr 28, 2026 at 02:24:40AM +0000, Joanne Chang wrote:
> Currently, f2fs/022 and f2fs/023 only clears MKFS_OPTIONS. This causes
> the tests to fail when leftover MOUNT_OPTIONS depend on unapplied
> MKFS_OPTIONS. So MOUNT_OPTIONS should also be cleared to ensure reliable
> mounting.
> 
> Signed-off-by: Joanne Chang <joannechien@google.com>
> ---

Hmm, Makes sense to me.

Reviewed-by: Zorro Lang <zlang@kernel.org>

>  tests/f2fs/022 | 1 +
>  tests/f2fs/023 | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/tests/f2fs/022 b/tests/f2fs/022
> index 728ef4e8..854ec327 100755
> --- a/tests/f2fs/022
> +++ b/tests/f2fs/022
> @@ -23,6 +23,7 @@ _require_inject_f2fs_command node i_nid
>  
>  # remove all mkfs options to avoid layout change of on-disk inode
>  export MKFS_OPTIONS=""
> +export MOUNT_OPTIONS=""
>  
>  foo_path=$SCRATCH_MNT/foo
>  bar_path=$SCRATCH_MNT/bar
> diff --git a/tests/f2fs/023 b/tests/f2fs/023
> index 33108421..f3e8785f 100755
> --- a/tests/f2fs/023
> +++ b/tests/f2fs/023
> @@ -25,6 +25,7 @@ testfile=$SCRATCH_MNT/testfile
>  
>  # remove all mkfs options to avoid layout change of on-disk inode
>  export MKFS_OPTIONS=""
> +export MOUNT_OPTIONS=""
>  
>  _scratch_mkfs "-O extra_attr,flexible_inline_xattr" >> $seqres.full || _fail "mkfs failed"
>  _scratch_mount "-o inline_xattr_size=512" >>$seqres.full 2>&1
> -- 
> 2.54.0.rc2.544.gc7ae2d5bb8-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
