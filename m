Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KVuDDlBsWmtswIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 11:17:29 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA167261F3C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 11:17:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=wzDatHcRgUFycJ2Aoe1yGlZWVms1urdK2t5McLvg+/0=; b=C2tmZkCT5cnuVpF77A46vzWnv3
	u+kaF/7zwcXpCiBi4If0uVPJG0r2WwfdOpML8Q6b9U2R8SY9ly0TOh+bUN4QkJtYVGm41gW0+gqd5
	a17+2IsStzXd/jVtrht1vLlqs9w71bLdZg7G1yEwwuICTkWU8fOGl+PIrf+ukcIH4cyA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0Gcu-0005NO-Ko;
	Wed, 11 Mar 2026 10:17:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3H0GxaQkbALox34pfqqjwfuuni.lttlqjzxjwhtsyjsy.htr@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1w0Gcs-0005NI-M4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 10:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UnHGnobw61SFIXjoQkpFSTWAD2vDTpEuCDpynbfiFco=; b=Czwhsbx6l+kTJjrbUCAUzbS+HG
 lFbW7Fd0ii7xuWf7d5zeSPEKcuQtMstgWqrIXmAc0fEeQWW5qka8ZSWD8soMk6639NOVfJbKcIpsJ
 iOFIMX0uvHNd2b26DbvSIU0yDGrFPpKXBn6u2avV2209QRjRAe0g7fL/HRrqEmUEujZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UnHGnobw61SFIXjoQkpFSTWAD2vDTpEuCDpynbfiFco=; b=S
 wJcwmQD+1RcfKXvGQqagPpkhMeD8+pHMnh6FjGFl00Tdev/mt0kqHB3QcIX6EFNeI3fcLcM5Ey8RH
 y7iNt3pnd0T25FsB7XhGh9Ts4V0ZerlQoMSsMNeiLl0F4+KVdrx0w1qs9WxOu2sTmz5+lXj44R5uQ
 DIjLbm1eQd83wGk0=;
Received: from mail-oo1-f69.google.com ([209.85.161.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w0Gcs-0003cX-7n for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 10:17:14 +0000
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-672c40f3873so235236820eaf.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Mar 2026 03:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773224223; x=1773829023;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UnHGnobw61SFIXjoQkpFSTWAD2vDTpEuCDpynbfiFco=;
 b=k8F8P2Dv2Y3CJX6Tu8M6MJPwYAFCTqklOQVkWhPTZTHw/MDqDojrDLLAleNsolZGd5
 4Q/aOBTt8RSAFGVgS+jz6qhQGmtRgQHyUsl4mLke4OTKSPEfPTI36TR7QmUyqzjFTI+c
 U9IUUMyBuDwVQfyf0jBud+7cltSX91QXg0XoBDp3VUlFogcxgEe6+ruUxfNixGUPbIq+
 4zOuuC3PDh0RGP5RRa9EPKdUcd8x/UHQVSsony4C13X8s0BpRm9TqQpJMfckDEfRXOvE
 oY4wIgiK15MkP7PHTKxP5N0OMHmK8sOgQaPfPIEj7Ah1Ehm6V/KUAbaJ2HlEa4sHf83k
 0ziw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWll0WSEXoWikJp5EuOXy3tVySlfjEbDSNjAMvB9cA6qTz1jNY7xi4ShcAx9RzNeT/iDUefqxdNkHL6F4tsLJdZ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyK7HbY0p691hnxBV6eRgUQu88taxmcoUQu0iEPskvlOvM7UBSw
 hEC9/ni3WRnV9Q4NeuyfYw9XokfbmB5D6IdXNQREbTovbJJEbYZLoy7SxdVKuju06gLJTQre+CB
 dWpnD6dckJmLvoZRCYZNaNRN1rJZxN6ZqcoN3o2M4M47S+S5LCBeXoxygfHU=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c8d:b0:67b:c122:d2a1 with SMTP id
 006d021491bc7-67bc8995cbfmr1247313eaf.37.1773224223623; Wed, 11 Mar 2026
 03:17:03 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:17:03 -0700
In-Reply-To: <20260311095738.4177239-1-wangqing7171@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69b1411f.050a0220.209d0e.0000.GAE@google.com>
From: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, chao@kernel.org, jaegeuk@kernel.org, 
 jannh@google.com, liam.howlett@oracle.com, linkinjeon@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
 pfalcato@suse.de, sj1557.seo@samsung.com, syzkaller-bugs@googlegroups.com, 
 vbabka@suse.cz, wangqing7171@gmail.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot tried to test the proposed patch but the build/boot
 failed: failed to apply patch: checking file mm/slub.c Hunk #1 FAILED at
 2629. Hunk #2 succeeded at 2828 (offset 168 lines). Hunk #3 FAILED at 2670.
 Hunk #4 succeeded at 4624 (offset -404 lines). 2 out of 4 h [...] 
 Content analysis details:   (3.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w0Gcs-0003cX-7n
Subject: Re: [f2fs-dev] [syzbot] [mm?] [f2fs?] [exfat?] memory leak in
 __kfree_rcu_sheaf
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: BA167261F3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=9d7d0fbecb37bff8];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[cae7809e9dc1459e4e63];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:chao@kernel.org,m:jaegeuk@kernel.org,m:jannh@google.com,m:liam.howlett@oracle.com,m:linkinjeon@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lorenzo.stoakes@oracle.com,m:pfalcato@suse.de,m:sj1557.seo@samsung.com,m:syzkaller-bugs@googlegroups.com,m:vbabka@suse.cz,m:wangqing7171@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_TO(0.00)[linux-foundation.org,kernel.org,google.com,oracle.com,lists.sourceforge.net,vger.kernel.org,kvack.org,suse.de,samsung.com,googlegroups.com,suse.cz,gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file mm/slub.c
Hunk #1 FAILED at 2629.
Hunk #2 succeeded at 2828 (offset 168 lines).
Hunk #3 FAILED at 2670.
Hunk #4 succeeded at 4624 (offset -404 lines).
2 out of 4 hunks FAILED



Tested on:

commit:         b29fb882 Merge tag 'v7.0-rc3-ksmbd-server-fixes' of gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d7d0fbecb37bff8
dashboard link: https://syzkaller.appspot.com/bug?extid=cae7809e9dc1459e4e63
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14156f5a580000



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
