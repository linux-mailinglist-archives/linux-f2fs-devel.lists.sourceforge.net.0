Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOraOGjYrmlhJAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 15:25:44 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2376723A7B6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 15:25:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JK735EV3qc6up6mDCrX7Dq48spnc6jGmYZWXC3exmg=; b=WPsSfIoIE2lbbwLrG4KFRVbUoO
	eMEci1hDzo6ST8IKfe31I+959Gw5AHUanfKdpmmi4KhAn1fxxSCNUQFjGGu1FCqdtRb8lT6zNQiuf
	OE/QHR24pVutCo3NUBQ+cfeZNUnxbJbjnG0jUC7Qjw8fIMY3G/9ZdEk2AIU4ADUhFCxo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzbXy-0006Bp-G8;
	Mon, 09 Mar 2026 14:25:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kth5965@gmail.com>) id 1vzbXw-0006Bb-Qs
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 14:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c7aG9u42wmFmQg8NexFKsDrO72+eXJWZ5zwfM9O0k3U=; b=IiD0F9HVpESGNgCqsI4mmBEj9N
 MEPzpoQ/HqI4DzG1gt/b4/9NhJ+5JI3jwkaK3KuHzZFYdVAezWZjv0jh5qunSJTjhMv0M6gU1940/
 hc+Y54qNPCn5d10UQkd9avuRiqo8zwoIHh09VS08YXIv4Ll3xj4hlnZjqJ7YATjayToI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c7aG9u42wmFmQg8NexFKsDrO72+eXJWZ5zwfM9O0k3U=; b=Tp61XFq2jqG+YNKe/XKmyPzm1p
 wxpS7E3hqc1x8uZsYX/eWeN2Q0riXiqk0vqmHpqV/KkGnpRww62Gf7PquvVH97WUtZ+Er1cVuqCWG
 am0mOMo1BYg9NOLy7jJGM8cdIQblj91tdQ0NIV5s3ggHJtekcXb+XQoPX/gfSW2ZI0nA=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vzbXx-00030v-5j for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 14:25:25 +0000
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-826dab01bbdso593258b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Mar 2026 07:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773066314; x=1773671114; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7aG9u42wmFmQg8NexFKsDrO72+eXJWZ5zwfM9O0k3U=;
 b=fDKgS3UGCMlJJsGN52xROYgvX2N2WcnuspshKr7PwIONvhX+HEKqkJJPQhQ82mhwCQ
 nJJ4xO9UOH0o46XMtFvydsFIa4Qt8977Kxo2jp9OVy22Pmbw63trUMG/F27pJv09YX/j
 Y6N1UIpDW5ePO36D3F3UjE94T6tqjn3V2G9+bFJiRATpnJuFON2+98UHxkOrbWVi1Kz/
 4eXtv56JbHfUWu/APRoRUdgrzQhmExcjD55Iv6t/F0Au3t3o1lf1QFs8OTVZ3IN0fz0v
 N4XqlJFWzPd4GgmjVzCTt8phBqDQDc69XlcnQwVPUihVQUgbwr9UII99dS2glciYpMHj
 6N2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773066314; x=1773671114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c7aG9u42wmFmQg8NexFKsDrO72+eXJWZ5zwfM9O0k3U=;
 b=tefhbli1mU//DgryEmEii6w+j+XSsRjhZMfKBR/ep1Wc/XBQzSXuKm5DvlYA9E0uRE
 emrry1fntczGxP4SEitUcFw/mz5ptgwkXxDDbKpIYQNRv5p1hGdJBgpQY/VWo6JX36JN
 crrIQung7Cyzov7kAd2Ki/w7w6r2fAA0NzNAZJmpYzigpmrRM4bALm0Fs219K8XJAG4x
 uXX1Vb6Gx6U/5vMoVwo++t6TXfyliHVpb4PVbOk6q5XH27aYxL/6MBHMm4oyO7ywlzZy
 fJ1OzebM2udtqRcpoepaVAZGywj7C1bp7jkxo5M1OZIA90oO78MD7q00N1cCFbJUTfnw
 7TOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRtbZFdOqg+o6VSHLuYzIm3nSKa2DogMDo7r7PyB8YlUq4f3zSNTdnbuqdk4Wx5D7rRflTR0TdLLukNLp5Sdiw@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxsV+ALXmo8QdbOVxwpAC1O8UPTsKSO45EZnpVUUIxjEzTVEz8K
 BOV2BZ+r06xwWQl9tfrbUQJ1Uplfg9Itsg/TMGqM2zlyDEllIIKmw9bt
X-Gm-Gg: ATEYQzwURb65M+tRk4Bup7tZW2m0ZtVywaZ1k1yYUfo6bcEK3PRZqHxiz6OvfDc0qxn
 2wsjtHUJlqlDBhdtK7HkdpUc1ttImyTwz4KwVeishredaTaNI8mnTA0YLtW6kJamA02wC6u0m3B
 JHcUUV4adZMtNug5RdZ1h7Kmn+TNPGGRnWXNZ08BbZIJbhGr9P9y+s/PYY8MBvvb0J9FZVr0O83
 Qxqnq81VaHIkChfmZMujlIGlRU3digZut+iUZaeQtHTKSaDfQbNV1I3ON9/6Por9PEU/KX2h+Bz
 3rHAF4vGEZXMScwopXzVSdSC21eUk9Jxz0i72AIDoplf8W+/9s5RtvxT2/FhLsJ53//bgkg0zAP
 UyStH4xN+cf8lNvabpyJxvGjix6RKND7eJkQ1dHfcBc3W8EKjeAP3B/A+rYA4Q6TCr4465H6VPE
 SmRAyFsWbS9htrHgQfP1ZC03wwVAT1vA==
X-Received: by 2002:a05:6a00:7087:b0:81f:e791:ea3d with SMTP id
 d2e1a72fcca58-829a2bc7669mr5220002b3a.0.1773066314438; 
 Mon, 09 Mar 2026 07:25:14 -0700 (PDT)
Received: from kt5965-NUC8i3BEH.. ([182.217.14.201])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a4636a9dsm10482027b3a.4.2026.03.09.07.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 07:25:13 -0700 (PDT)
From: kth5965@gmail.com
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  9 Mar 2026 23:25:09 +0900
Message-ID: <20260309142509.75703-1-kth5965@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9df7bc57-f0e1-4c7b-9ce1-0017eab62c2a@kernel.org>
References: <20260224160654.448538-1-kth5965@gmail.com>
 <20260224165408.450957-1-kth5965@gmail.com>
 <9df7bc57-f0e1-4c7b-9ce1-0017eab62c2a@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, Thanks for the comment. I took another look at the
 path, and I think you are right that my current fix is too broad and may
 hide the real problem. 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [kth5965(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [kth5965(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vzbXx-00030v-5j
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: evict: truncate page cache before
 clear_inode
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
Cc: kth5965@gmail.com, linux-kernel@vger.kernel.org,
 syzbot+fc026e87558558f75c00@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 2376723A7B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kth5965@gmail.com,m:linux-kernel@vger.kernel.org,m:syzbot+fc026e87558558f75c00@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[kth5965@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[kth5965@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,syzkaller.appspotmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,fc026e87558558f75c00];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action

Hi Chao,

Thanks for the comment.

I took another look at the path, and I think you are right that my
current fix is too broad and may hide the real problem.

It looks like this happens in a more specific case, where an inode
still has FI_INLINE_DATA set, but FI_DATA_EXIST is not set.

In that case, f2fs_truncate() goes into the inline conversion path,
and f2fs_convert_inline_inode() grabs folio 0 before it checks
whether there is real inline data to move.

Then f2fs_convert_inline_folio() does this:

	if (!f2fs_exist_data(dn->inode))
		goto clear_out;

So for the empty-inline case, it returns success, but folio 0 seems to
have already been added to the page cache by then.

From what I can see, f2fs_grab_cache_folio() may create folio 0 and add
it to inode->i_mapping when there is no folio at that index, so
inode->i_data.nrpages becomes 1 there.

After that, f2fs_folio_put() only drops the ref, and the folio stays
there. Because of that, clear_inode() later sees nrpages != 0 and
hits the BUG.

This is the flow I am seeing:

f2fs_evict_inode()
  -> truncate_inode_pages_final(&inode->i_data)
     // nrpages = 0

  -> i_size_write(inode, 0)
  -> f2fs_truncate(inode)
     -> !f2fs_may_inline_data(inode)
     -> f2fs_convert_inline_inode(inode)
        -> f2fs_grab_cache_folio(inode->i_mapping, 0, false)
           // folio 0 is inserted into page cache
           // nrpages = 1
        -> f2fs_convert_inline_folio(&dn, folio)
           -> !f2fs_exist_data(inode)
           -> clear_out
        -> f2fs_folio_put(folio, true)
           // only drops the ref
           // folio stays in page cache

  -> clear_inode()
     -> BUG_ON(inode->i_data.nrpages)

So it seems better to fix this in the inline conversion path,
instead of truncating all page cache again at the end of eviction.

If you agree, I can send a new patch in that direction.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
