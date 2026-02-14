Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMrGJdLikGlmdgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 22:02:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E05F413D3FA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 22:02:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAfstk0A1ijlNXqO4k47bGKbjtGytjqdaWeiE7empJs=; b=WfX9Azz7TQVGquWVm4ldRY5tf5
	Ubu3SdFDm362TShPwxl8cXWg6gPajg42a/YQTNTRBS6T0eJMnGXMYA4PW07Nl/VMLJ2KDcPlH8uTV
	i+8kS+1fGfAMrnNAD2+2g24vrIc86EjQ4FV/Kc7V+e16hI5f2hNuY1CGc60HWzdHMdZg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrMmB-0005V8-JQ;
	Sat, 14 Feb 2026 21:02:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvalds@linuxfoundation.org>) id 1vrMly-0005Uh-SC
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 21:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JbvQMzer3/FUOLzQD0nRpytAmjKpWlv4HRm0x7BxSPk=; b=adjKXWvJ8JM8K5nZx6LF96IqyO
 1Bj5FV2CXCIFPe2TmOvxzb6XOk//6mb3P5Yw4WcoWCcDOKxZn7iBMxQoLRJDV4HwMBlJ4OlfokHGH
 e6WjT/0YVeH73dnwYWmqs53Ua811yGrbrU0S63Z4RrnnJ66F4CkERptjIbhbLKAJ1LUA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JbvQMzer3/FUOLzQD0nRpytAmjKpWlv4HRm0x7BxSPk=; b=M2ACmIp61Td5gMJuGopZnvHbE+
 1AbpZ138cFmjtjDc1yMF4mU8256A5LelFHjc+leHc6ADrCRgFuCCkm9hV15edY/TXbFGWKMpGMBqu
 KQAgYKEvoq9mbyUvnOavHQZgwRuD7dix2ODxah44P+ibsDqa0Bbxwf59FGgHCZUNcTpU=;
Received: from mail-ej1-f43.google.com ([209.85.218.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vrMly-0003kA-9I for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 21:01:50 +0000
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b8f92f3db6fso319534266b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Feb 2026 13:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1771102899; x=1771707699;
 darn=lists.sourceforge.net; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JbvQMzer3/FUOLzQD0nRpytAmjKpWlv4HRm0x7BxSPk=;
 b=VUDSq8F/L2grf6m6SI1r5cDB6Gd++nxB37ELR9FuUXRC31mKKAnbYKASDcBWs5ps0L
 HKQcc9f44cgnt62euXlsqOaIZROfaSX8vk7UmXPzqthqJXkk/wLPKF0Jt37t1zt7QGga
 henX59MyJhCvPN3SUOXHkUQuIxD3pmz1axcsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771102899; x=1771707699;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbvQMzer3/FUOLzQD0nRpytAmjKpWlv4HRm0x7BxSPk=;
 b=Q9s1QiLjAjrCDh+5akQ6c/Jy+NSJuyw+TMnAMicybJwgW82z1sysjDnM27MzHE1FP6
 TI87jhUDKpjsoLyaO/dBUEzibBczDJ8V9b4tyNghDt9wpQIGqgbHK2bmffb1M7lgEGzF
 EJielk9RzUFow7zLq44ne1rH5t53nXiyhMqYXqXEZskJ0xeagd6RKxCkbfPCoPXnGwN+
 4RJMNlm21JEwnKyok8mj2w+0TmxGQPGgbb+hUBIMhFJRnLPG3N4tU1UHJjnkI2hwv2WL
 H1go8qdqOPHQbarnIs5pvsanTNIeyIz/xybT+PGWNnut95aTlQcOKoQkn1h82XC5AquT
 dNUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV211hWgy2Got1d+mYq5a7pmDpN/TWKegIIPkBZJDVhvc7mvGmDPW6bI+5KNtApP6UVqmSr0865jldxtTrsl3ai@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwQ/tuIEYZnXpbyrX7JrWEQo4l2gMbmMC42CQrPdYgzyc9U1C2K
 Tnu+zRx0t7FmK9f7rs5FtSY9kUlC9Xsz85N55PTVJSj0SfFCMJaoJedVOQTt33SXXVnF/vE5tOR
 mX2WFA0c=
X-Gm-Gg: AZuq6aL/bas+981ThFY0cTCJIA8LFTfXhWGxY4SL6VvwTU/aHRdb2nMu7bYcDrbdeRj
 Yu+ToT+kdddG6DHIlewu1PjfOgLs3zsh0s/ngvFp9ClPv+W28kVACWXsHaUCfDi2FogOcZ6FEpS
 ZdEeiV3rHhDbG9Xhrn0nSLqtU0HPM7KFWo6TwFyDrEs4UjsyFTcBEY7h9MBC0JCJ6Pq46yEbeRw
 k4z+1/EJ+sSVk7wK/854q6AJhj1q/bcA3sdgPn54QrhIIsZ9gHY1AT8hY/T5BBLOdDJrS1ZUtHO
 2zy3a9F5qkAJJH/fau02zdOIouYEtRBoYSOFxavK/ApZHwDHebM339chWyc1X2smGtvml7NsGc9
 Mc1uAwJODxcWVxg+tavJC+bG7YGdRMY/chWslCaDQx2OHeAKzieJuHgG+LQaZ4oeEPrO89IiLqq
 t+0zV2iY3hWMW2OSTP2POMt5L//Zq8qIXWhi3L430gwBx6BYeXEw2yLZzQODpQYZ3e8I9bjw2q
X-Received: by 2002:a17:907:868b:b0:b7c:f5b6:bb52 with SMTP id
 a640c23a62f3a-b8fb44c2df0mr327124266b.43.1771102574109; 
 Sat, 14 Feb 2026 12:56:14 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm101480566b.14.2026.02.14.12.56.13
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Feb 2026 12:56:13 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b886fc047d5so305921166b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Feb 2026 12:56:13 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUWUeXDM9/1h0vvHTkU4omLsoqdqJFCPJGRah0sOgLIgL7BEb3Xxs8xPZ1LI4f7JZH9tr7cRpE/sZBoMzLO9hUB@lists.sourceforge.net
X-Received: by 2002:a17:907:3fa4:b0:b87:2780:1b1e with SMTP id
 a640c23a62f3a-b8fb4485f66mr344808366b.41.1771102573559; Sat, 14 Feb 2026
 12:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20260214203311.9759-1-ebiggers@kernel.org>
 <20260214203311.9759-2-ebiggers@kernel.org>
 <CAHk-=wi60UWZ=kVayGKfrGURiX4aN6P4J_bNMOw_pSvUrxw1jw@mail.gmail.com>
 <20260214204833.GA10472@quark>
In-Reply-To: <20260214204833.GA10472@quark>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Feb 2026 12:55:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjiNgOopJgV9=apY8AzOBAqXi=xfWpzN-3dkhL=5_4UKg@mail.gmail.com>
X-Gm-Features: AaiRm51_6K5-2xlX2SS3HjfeJ2KHPjBlp8PFC1E0bbiJAg4nV-gV3EBEtvG_dBo
Message-ID: <CAHk-=wjiNgOopJgV9=apY8AzOBAqXi=xfWpzN-3dkhL=5_4UKg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, 14 Feb 2026 at 12:48,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > The reason I went with the direct conversion is that >
 f2fs_verify_cluster()
 clearly assumes small folios already ... and that was exactly the same
 thinking
 that led to the other bug - "it's fine when folios and pages are the same".
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.43 listed in wl.mailspike.net]
X-Headers-End: 1vrMly-0003kA-9I
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use fsverity_verify_blocks()
 instead of fsverity_verify_page()
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
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,linux-foundation.org:s=google];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,linux-foundation.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E05F413D3FA
X-Rspamd-Action: no action

On Sat, 14 Feb 2026 at 12:48, Eric Biggers <ebiggers@kernel.org> wrote:
>
> The reason I went with the direct conversion is that
> f2fs_verify_cluster() clearly assumes small folios already

... and that was exactly the same thinking that led to the other bug -
"it's fine when folios and pages are the same".

And then when the caller was then changed to know about large folios,
the code silently became buggy even when it visually *looked* right,
because the page-to-folio translation had cut corners.

           Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
