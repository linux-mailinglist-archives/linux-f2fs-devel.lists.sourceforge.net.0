Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE36B02AA8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Jul 2025 13:39:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kMiJ4mclVZjFQDiqVdSzIjbgcbxUAZKh6KYgyzFTVHU=; b=N6iZPh0C9ZVNNGSvfQbJem+6r+
	NbeylIstgaxXUNzlHdQlg5DVZgPtcrgybOr7aIhjU/1USeRLnmoPp9+KK/1va1kXD4lOSGQv8GUSI
	n5ZTBXkcuReS5nNpgfbzvg6Kt8KpsdCjFzLmX5bO4KdrnO3pKhRgG3+RlLgyQDgeG3P4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uaYZh-0004tC-ST;
	Sat, 12 Jul 2025 11:39:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao.sigma@gmail.com>) id 1uaYZf-0004t3-MC
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Jul 2025 11:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z+hphwYq2ZInrGKIM2wd3YeuzEMPqECi8bCW4A57a7s=; b=d9zPf59VU3RD2pBg5omIx1B5d6
 8hygO6bntViL5k0LpuDgZ1qamcmoRXinKN20LVW+iqKPHvJpQ6Hsgt6moORWBdJ8x/WI9RL+2gXUy
 pPnhmmNpBMlWgGeOfhlm7gcgse/zvjtgsMJ1pGaZnlHNwcaIqh79UBJvEzuzxik/K5xI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=z+hphwYq2ZInrGKIM2wd3YeuzEMPqECi8bCW4A57a7s=; b=E
 35pzY0RbjB3qqCyIwmO4ZdXun/zYnHV3Q5CnQOX53rOnskKZMtSm8+mtRPsQ/of4Unm9JJXHPG+0l
 95eei3sJpjQKSz2GKZyEb1Rrwb0neY5JiW0l0rJ54kaScxgoXAWdEXXqCBMSkQ0HhO65kDU93rCua
 sV19EPgmeuZLeHH0=;
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uaYZf-0007Hj-91 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Jul 2025 11:39:23 +0000
Received: by mail-ot1-f66.google.com with SMTP id
 46e09a7af769-73cddf31c47so2062573a34.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Jul 2025 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752320352; x=1752925152; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=z+hphwYq2ZInrGKIM2wd3YeuzEMPqECi8bCW4A57a7s=;
 b=M78Q58PWfLTd4HsOW5c2RZK+xYgpGlHh6u/gJ2gIOOjE6oSd+Q9WnjJUAY+X0l18cE
 nKCJFg/kig7Cqg2jraPgu8WPzkuhJcveyZ2m9ejoNrHOOl01EYsYxDI6qAMEBLSEYycL
 3lyEQv8zMJ/ZjuaqD9E0VLX8mkyMuYRZ+Xyec3Iaf6qsHbq8V4sqc9D96weYc7jYcC9X
 MJpzR8JlaIN202oKqvDDW3BgJ/s+yeXM+LOuRFt/nGFLkCcFPA5PPNYjfhz/0kX6fkOi
 KWS8PAqWIo+XG9WupNRAaDwh+GGZB05r8NFy2e7jhkFKH7YaUFeoxBO6VPg8FP6I0iNU
 dxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752320352; x=1752925152;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z+hphwYq2ZInrGKIM2wd3YeuzEMPqECi8bCW4A57a7s=;
 b=s3+TE3gQkf9b/2aY7gEG0B+N1yz6c4AX48ITFTVT4duQfLpSxnwzXNxe9RWnA1I97o
 l2ICF9xabfzM/xwcYBf/g7gQiuqbUhchExAGEGxr1KqanfdTMSaSQ/LRb/cujvjqjWhi
 a7WLIvZinhuHIVDfWK6qvVF53lrckqn3s6eR26/rcTa9YnNKzNz8f7IKfIVt7TI/fLZL
 0GVBhqUMYXo/XuqI/w2ciSzEOaJr1XpJwxrr1bE8iRAWbbeRNEIvZR9kf6N9un+mqXUW
 f+4mxb6HF4R74QUFiBamYy9njM7iQwWeNFPrWmZ5nQ1Fe1paDjHc834rhe3sCYOMi7+7
 4i4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXosupFcoxwKauldMCxeLOdhssH0SWQAeVGxclrFzLChokB4HfpBgcBMNGekuHQd6KN4N9g7ctRxqH1gbEK4Rh2@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzkwiMT+Cl8/9LK/PW5U+wJuw4jqHCmQsvuab8CVygSMfFBaZlw
 hBpWYUn8VsLaPHOM0pOn0F4YW/jQZsfzOrgR1vZnxhcQGJomg+jHSprsBFE5UB+zsVza1mW4wQR
 6FGXk7U5sGtnQHaYpgkXgcLWkGYfxwa/tNtm/6XQ83y8o
X-Gm-Gg: ASbGnctaVVU0pEDYIjj5KmVYT6d+9m1DGlSjBk9QlNnbvDNRz0F00EVhxFgSu9aZgMs
 kz37HYYR90UZjlxVKwdN08Was5ORF5LP/XlFQ40rU+IwM6gf80eSyJ3qDHTzoB+O8bDQSDFONrc
 mg4j6ENL9sEpF1qBntacSuoZEtqONiMBelHWZdhlhfhnZT5adVEvcv3ZMe3JoWaZamthFtHe7a+
 sv0uBJp
X-Google-Smtp-Source: AGHT+IGwCknRb9TX4axNtJrpdIsxoBizbasQ+GqUpO6UhqpsJUcjItWNj2toik1DFUFKJD6JMjOjW9zbfAiNr/cKeCQ=
X-Received: by 2002:a05:6830:4182:b0:73a:6d48:dec0 with SMTP id
 46e09a7af769-73cfb20ef5cmr4539033a34.20.1752320352572; Sat, 12 Jul 2025
 04:39:12 -0700 (PDT)
MIME-Version: 1.0
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Date: Sat, 12 Jul 2025 19:39:00 +0800
X-Gm-Features: Ac12FXxL4cTL2wMefTk91E1WhIQIQyhp3qZIwyVO1lvywwvylh800-a3JzjkifE
Message-ID: <CAMLCH1GjsjgLDZdqFnRRxycoGoHH1Ayu0rUBHeusyQVhZfBopg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Dear Mr Matthew Hi! It's been a long time since we last
 discuss
 about f2fs supporting large folios. I hope you're doing well! Over the past
 three months, I've been working on large folios support in m [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao.sigma(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.66 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uaYZf-0007Hj-91
Subject: [f2fs-dev] [WIP] f2fs: Sharing progress and questions on large
 folios support
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "v-songbaohua@oppo.com" <v-songbaohua@oppo.com>,
 Zhang Yi <yi.zhang@huaweicloud.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear Mr Matthew
Hi! It's been a long time since we last discuss about f2fs supporting
large folios. I hope you're doing well!
Over the past three months, I've been working on large folios support
in my own fork of the f2fs tree. I've made some significant progress
and have a working implementation for:
- f2fs's own per folio struct f2fs_iomap_folio_state
- iomap-based buffered read and write.
- Large folios support for compressed files, including both buffered
I/O and page writeback.
My work is based on a several commits just after your "f2fs folio
conversions for 6.16" series on f2fs's dev-test branch(Not the
mainline) It can handle run on some simple read/write operations for
both normal and compressed files, but it is still largely untested.
You can find my WIP branch here:
I saw your recent series of patches for large folios support and was
excited to see the progress. I'm writing to you today to share an
update from my side and ask for some guidance.
Regarding our previous discussion about storing extra f2fs flags in
folio->private, I implemented a solution using a new
f2fs_iomap_folio_state struct and related APIs, which I placed in new
files (f2fs_ifs.c/.h). My design not only supports large folios but
also maintains compatibility with order-0 data and metadata folios
which storing the f2fs private flags directly in
folio->private.iomap_folio_state won't allocate for them. The memory
layout of my struct is also compatible with iomap's helpers.Now this
piece of code  conflicts with your latest patches that introduce
folio_set_f2fs_data. I assume the standard kernel development workflow
would be for me to rebase my local branch onto your latest commit and
then refactor my code to align with your new API. Is that correct? I
am more than happy to do so and adapt my implementation.
On a related note, I recently learned that storage engineers from vivo
also implemented iomap buffered write and page writeback conversions
for f2fs last year. (The latter shocks me, and I'll explain the reason
in a future conversation). Their work seemed doesn't include support
for compressed file large folios. It seems necessary for me to
coordinate with them.
Looking ahead, I understand that a feature of this size should be
submitted as a series of small, logical patches to make the review
process easier. I would be grateful for any thoughts you might have on
this approach as well.

Any feedback on my work or advice on how to proceed would be greatly
appreciated.

Thanks for your time.

Best regards.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
