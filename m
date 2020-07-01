Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 553DF2107D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 11:16:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqYrI-0001cj-BB; Wed, 01 Jul 2020 09:16:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@redhat.com>) id 1jqYrG-0001cb-BE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 09:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bir7bqjcJgYEot4xBxckFswPYyAETyRptlOPMzbduK4=; b=bcIDHgSF9VN0lX9lobJkIJzPUR
 NIp/oxiQTdhryWXo3sKpDaecCjrGzPxiqzvPA7hdNzYaNrw2pzSMdfnRInA3gbNDgxvVsquiv/UqG
 faFYqNZ06Rc7FvLwt9u+FkY7l2t4Ox58633lBAWgi3g8EShFFF/OnOGdPMNlYvfstw4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bir7bqjcJgYEot4xBxckFswPYyAETyRptlOPMzbduK4=; b=iIx107TxvVqP8cWhwi3wDBYdnW
 sVD3R6/9HI51eTXODD3mgtkI0b4M7nTNMr456lFBR07dDXFBlXFfJmHaboz64pd+IxRWimcvbLpPh
 JCAodf2997GwsGTcV8j8mN1WPrKUq7C4v0ULER849Lm2DpriKvkvjGWYQKgL5M487yow=;
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1jqYrC-008TEq-5q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 09:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593594995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bir7bqjcJgYEot4xBxckFswPYyAETyRptlOPMzbduK4=;
 b=QnadbUsZbLTN5/jlkP6POk5KgfIcrNMeTzo2Tz/I1qkv1d5MK4Al7uqH7AmJu2t2qvBZX1
 euZwal7ot7dJ/rlvdEhB+Fx9P7vA4PEUDEMgFTmcQUEv2zkNHLiLq9QK9MzUc6s8GygnyY
 IOkUjwzvhn6Nbd/33/melJpUKM81KTw=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-0emo3dh0PiuiFYFJb0FLIg-1; Wed, 01 Jul 2020 05:16:34 -0400
X-MC-Unique: 0emo3dh0PiuiFYFJb0FLIg-1
Received: by mail-pl1-f197.google.com with SMTP id 59so13839742pla.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 01 Jul 2020 02:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Bir7bqjcJgYEot4xBxckFswPYyAETyRptlOPMzbduK4=;
 b=dgco2t5YgXSHtb8Ux86cUk12OS/YWEXu3detM3o7dmiwtMRl2r+KMxwaN1dnRUnSEk
 qgqgmpLXBn/N3L6owHrW1UKtJ54obQE80i/6s4TRtc0caaqXnMf0Wxi9amTabzaqTLBV
 ataKb5jEgyvwCv6boDLHXgdUfqu5Lr7QyKe0ZbumnahGcN2yIEa4YKBfmu0aG/O8m4fO
 EKgpbMc5CQqihFSnnujujCUXzJDST6kir9p3D/aqmKcrdUjzxtiv7WiGMO73kW5MWFz3
 cLDc9mKVQstPVgAVqbGyoRhZUgfrG1FSAOy6zfrFO8zQeS8AaAnH6LyzHA+uOselrDwB
 0LHA==
X-Gm-Message-State: AOAM532TrqAE18v8ElpmEC+xS454xmECZSH8vXZiw1KAAIK4QkhtpADv
 4VMiaBaQtAk5VqBFV2QDYvZd0eonYGIvpO3CEUozr93RCKoq55Ya8twJbzLdZsJreBhamTva0YZ
 wC5JBRf5V2DYz/GkemfhZ3djOPtoPeI2/StDoLg==
X-Received: by 2002:a05:6a00:1342:: with SMTP id
 k2mr22670769pfu.32.1593594993512; 
 Wed, 01 Jul 2020 02:16:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQMFIc/PWlagM5muWuijz1ziAMv88d0MVJCM3+aCsE+fzjpDjphfTL7QLKhA0nRjttqGaYng==
X-Received: by 2002:a05:6a00:1342:: with SMTP id
 k2mr22670744pfu.32.1593594993229; 
 Wed, 01 Jul 2020 02:16:33 -0700 (PDT)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id nv9sm4869318pjb.6.2020.07.01.02.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 02:16:32 -0700 (PDT)
Date: Wed, 1 Jul 2020 17:16:22 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: lampahome <pahome.chen@mirlab.org>
Message-ID: <20200701091622.GA5411@xiangao.remote.csb>
References: <CAB3eZfsO0ZN_79oaFpooJ32WNZwwyaS4GBb+W6jR=buU-VczAA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAB3eZfsO0ZN_79oaFpooJ32WNZwwyaS4GBb+W6jR=buU-VczAA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.139.110.61 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jqYrC-008TEq-5q
Subject: [f2fs-dev] Fwd: Any tools of f2fs to inspect infos?
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
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

(cc linux-f2fs-devel, Jaegeuk, Chao.
 It'd be better to ask related people and cc the corresponding list.)

On Wed, Jul 01, 2020 at 03:29:41PM +0800, lampahome wrote:
> As title
> 
> Any tools of f2fs to inspect like allocated segments, hot/warm/cold
> ratio, or gc is running?
> 
> thx



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
