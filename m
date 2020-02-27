Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDCD172A15
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Feb 2020 22:25:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4G28zG2XRrVEVPSSe6x2qwNUXKlBrq2Meg6u0ad6l5I=; b=eSxGwg6MrIsDq+6EZtVdMwMSG
	rXc94jazTzqRqMdSp13r5Pk76ZRm1CXj4SpiZhTTRzQHTX3+87zhIwM0+iidSzlp1IvBRqnguzit1
	JGyxRBVsbAQ/wB7GhaSKLG2gQfJdrl2n6YJ+J+eeHlU6NLJX15s/TZwarL9ZitABVdTXE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j7Qeu-0000F2-PS; Thu, 27 Feb 2020 21:25:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1j7Qet-0000Es-Oj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 21:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zbiMEvwdKM/tvZAA5Qj434C9S081Ob3tK31bpwxJweM=; b=cRADfYRbZ2IGaxP/gSNoMMVrki
 t80MMWzTI/XoH/2iNXH/GT3YwjEjHLdsFUvYV0ZpOVhqKpyFGyUy0HYDeXQroX1D23IbB6rSoZH3p
 9m/swcYH8QDo0L6yc+alsxsYz3CXiEhA6UlzmOqez8SobiXPfEPeCgOUVYLlc8u76MoQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zbiMEvwdKM/tvZAA5Qj434C9S081Ob3tK31bpwxJweM=; b=faKNKR8+SDJAkQ8uqJMx8gwrj1
 OGT/z3fqYffH1op3tSTz28k0JhMeJ1xroBzdz7iGj6nUAHhEdLLGtOWF3YI/HB7vSEBS8HqOWqxCA
 ivXREXhn/SDHrY6tgreHpDXQndMNhcHScqViZu/1LLsB2RezRSxMeds2NoFn6X1U42HM=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j7Qep-007zw1-AW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 21:25:27 +0000
Received: by mail-pj1-f66.google.com with SMTP id ep11so332874pjb.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Feb 2020 13:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zbiMEvwdKM/tvZAA5Qj434C9S081Ob3tK31bpwxJweM=;
 b=PD5AuIH9YkPwMY1wk/M2YjcFyJ0ifFKkRpny5ZyGDYGn1QOO/zohITOuyJrm8SULUl
 7i+MnHC+yUTXTPi9Ej+G5yNVS3jFkcc7VmG08QcNrBd6venEz216NN4gW5ri9dfRMEY5
 T9q3N+SI14tw/2hmTyKa+XjXBZtxMwuu/SYW/t2qpCgLUResl8ne20dFgnF5Clkq+VPd
 fKd4zMbXTcBkWMq/t3v6ItovAlemxDo+YGgs9x//wHp14jvdIoTrJr8E7cFsndG+SFrU
 lQ3Su/cUXhsTRXyXiXcqdziWtx03q3ThazV8PbjImCgXZMy3x3k0A2xd3rU2TVHPaLCB
 3Adg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zbiMEvwdKM/tvZAA5Qj434C9S081Ob3tK31bpwxJweM=;
 b=tjwBEMJtiurE+mVkm3aKynPA5d5O2AhYUXR94ZxK6Z1Qa1agWsNnVFSeh39DDpjm5s
 4qN7JLFnnKRH7wyPQ6DEIFErKvRD+9F7Rq16+1hg4gTZxKwc2QdVSYm5ge2lc5sdDx1B
 ixd4/RqEjTNMGKxKBRFvngnN2VHZKcvlkyENU76zv8vxq/Rlcb/DfmkCll9YmD1NytHd
 kmn2aWPgNDTE6jZce/eVBj+kN6YSmXn3UH8S/iMHPbQqb6VZf2/lHsx0LZpmVeJ9t5WX
 tpDYiI5z5qz0bGjOFNs/m5PvGYnk1D8PTdJG2aPees+bPdtZKGsgse0Q8oDGtgfbLbol
 eO0w==
X-Gm-Message-State: APjAAAX7eDb6ScMoREcoymanXuMWakNgIIK95SnrfBiFf6a08TIgAxXs
 ukEIB2SzKoedqBuF3BQdtOrsqg==
X-Google-Smtp-Source: APXvYqx9TDG0Lr2SN5dRxW/+L8a98eXpzWzxOnFNh71eBbIDihuNaU52qVET1Y7r5ElfIRGM27CypQ==
X-Received: by 2002:a17:902:6907:: with SMTP id j7mr807838plk.88.1582838717243; 
 Thu, 27 Feb 2020 13:25:17 -0800 (PST)
Received: from google.com ([2620:15c:201:0:7f8c:9d6e:20b8:e324])
 by smtp.gmail.com with ESMTPSA id k9sm8493396pfh.153.2020.02.27.13.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 13:25:16 -0800 (PST)
Date: Thu, 27 Feb 2020 13:25:12 -0800
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200227212512.GA162309@google.com>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-2-satyat@google.com>
 <20200221170434.GA438@infradead.org>
 <20200221173118.GA30670@infradead.org>
 <20200227181411.GB877@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227181411.GB877@sol.localdomain>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -13.4 (-------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 2.6 FSL_HELO_FAKE          No description available.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j7Qep-007zw1-AW
Subject: Re: [f2fs-dev] [PATCH v7 1/9] block: Keyslot Manager for Inline
 Encryption
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Feb 27, 2020 at 10:14:11AM -0800, Eric Biggers wrote:
> On Fri, Feb 21, 2020 at 09:31:18AM -0800, Christoph Hellwig wrote:
> > On Fri, Feb 21, 2020 at 09:04:34AM -0800, Christoph Hellwig wrote:
> > > Given that blk_ksm_get_slot_for_key returns a signed keyslot that
> > > can return errors, and the only callers stores it in a signed variable
> > > I think this function should take a signed slot as well, and the check
> > > for a non-negative slot should be moved here from the only caller.
> > 
> > Actually looking over the code again I think it might be better to
> > return only the error code (and that might actually be a blk_status_t),
> > and then use an argument to return a pointer to the actual struct
> > keyslot.  That gives us much easier to understand code and better
> > type safety.
> 
> That doesn't make sense because the caller only cares about the keyslot number,
> not the 'struct keyslot'.  The 'struct keyslot' is internal to
> keyslot-manager.c, as it only contains keyslot management information.
> 
I think it does make some sense at least to make the keyslot type opaque
to most of the system other than the driver itself (the driver will now
have to call a function like blk_ksm_slot_idx_for_keyslot to actually get
a keyslot number at the end of the day). Also this way, the keyslot manager
can verify that the keyslot passed to blk_ksm_put_slot is actually part of
that keyslot manager (and that somebody isn't releasing a slot number that
was actually acquired from a different keyslot manager). I don't think
it's much benefit or loss either way, but I already switched to passing
pointers to struct keyslot around instead of ints, so I'll keep it that
way unless you strongly feel that using ints in this case is better
than struct keyslot *.
> Your earlier suggestion of making blk_ksm_put_slot() be a no-op on a negative
> keyslot number sounds fine though.
> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
