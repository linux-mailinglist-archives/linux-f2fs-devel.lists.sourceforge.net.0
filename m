Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E1AD3A03D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 08:44:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Message-ID:MIME-Version:References:In-Reply-To:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVocgNdJ8kULHdDzhJSAHmdm69L9HF5ifwP0GOmwaVc=; b=jJf2lnC2tvpn0YKUn4gE8tOZ/M
	8wVAA0s0TmAidKdzvzapta7jb5+krw+mkR5irjsChVy5GzRjEHm3f5KCwqGnMEzGV4y0INh+cGBJL
	v67YSL0LH7hRITHJ8fP+M8xyayvGy4C4MOjizv/8Z3cV5f5VVhAJOz9xgaMgTvOYMFpA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhjvw-0000xl-QB;
	Mon, 19 Jan 2026 07:44:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vhjvv-0000xd-0b
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 07:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4RtN0Njllh2bo8JeuroC2zuL9c4Ft+3Kqcr/9koQXEE=; b=cFHcxoinm+2N8jco9CJzgiUVKi
 rcnt5stPsGgfukh9gRdwlaPlKNGlXIz90BzP9DcJ+u6u/T9msqPvwy5wfNklCFfI3qh+G+sYBBLlu
 utMMPASteIhiRTbxk/cQ6t3NcwFouPRL2gsiiqks3DO9W95Nfd0JQAmCijckVgaJjG+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References
 :In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4RtN0Njllh2bo8JeuroC2zuL9c4Ft+3Kqcr/9koQXEE=; b=RVyNUYgtKUJVMizpXUf9ylMT+N
 Ab4vDpjF9ajrjav5yy4lpgx2inXSerEdkwmF8s95NUFo+Y8QAkYt3zny+JQLjDHy2ydX87tPiEQU4
 cym9JpNIUd+JtImu3A4rS6s2Mdp7H8KD6yC7i8styB+h9P728SVtlGclB3Ng3sHtOMLQ=;
Received: from m16.mail.126.com ([220.197.31.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhjvt-0001jf-TJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 07:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=4RtN0Njllh2bo8JeuroC2zuL9c4Ft+3Kqcr/9koQXEE=; b=J
 Rijz9MTg3XRTpovgnjvAomfIMu8dfD9dsrU+jVV3/uWxWiFjAeVMko5KoUmtP5/N
 eNQ8CykFGs9uXhYfs8ZlwjyMkvIiEQAIxdcplVdoYNHTMW4ZKe07bH4VR+pWPtnC
 UtcGhd31fPoyQkFSLAd0BPucuXZ7elNYzjGVYfk5x0=
Received: from nzzhao$126.com ( [212.135.214.5] ) by
 ajax-webmail-wmsvr-41-118 (Coremail) ; Mon, 19 Jan 2026 15:43:47 +0800
 (CST)
X-Originating-IP: [212.135.214.5]
Date: Mon, 19 Jan 2026 15:43:47 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Chao Yu" <chao@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <32fa7311-0393-4e71-a927-3c502e40efd8@kernel.org>
References: <20260112013320.8028-1-chao@kernel.org>
 <5e888451-228e-41e5-ada7-a22a61cb84dd@126.com>
 <32fa7311-0393-4e71-a927-3c502e40efd8@kernel.org>
X-NTES-SC: AL_Qu2dCvSbt04p4SWdY+kfmUgRgOw3XMSyu/oi2o9UO5FwjA/j3iMYfVxgBGnQ/8yDLyCXjRSJcxdE9e51Y4NGRLMy22Q/ufEfMeIx6SdBJvjZOw==
MIME-Version: 1.0
Message-ID: <6d6b3bad.5f72.19bd535bd6d.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dikvCgDHf7204G1pArNHAA--.62357W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBohQb6mlt4LQsRgAA39
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao: At 2026-01-16 16:52:02, "Chao Yu" wrote: >> >> Do
 we have plans to also support reducing f2fs_map_blocks() calls for >>
 consectives
 holes in logical file postion with dnode have already bee [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [220.197.31.8 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
X-Headers-End: 1vhjvt-0001jf-TJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid f2fs_map_blocks() for
 consecutive holes in readpages
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao:
At 2026-01-16 16:52:02, "Chao Yu" <chao@kernel.org> wrote:
>> 
>> Do we have plans to also support reducing f2fs_map_blocks() calls for
>> consectives holes in logical file postion with dnode have already been
>> allocated in buffered large folio read?
>> Such as consective NULL_ADDR or NEW_ADDR?
>
>Nanzhe,
>
>We have supported that for large folio read w/ this patch?
>
>Thanks,
>

Sorry, I'm a bit confused.
In the condition of F2FS_MAP_BLOCK_DEFAULT, the default: case will only
set map->m_next_pgofs to pgofs + 1 then sync out. When we enter
next iteration and the index advanced, currrent index now turns to pgofs + 1
and index < next_pgofs become false.In consequence, we won't reduce
f2fs_map_blocks() calls for hole with dnode allocated.

Also, for NEW_ADDR, the default: case will directly go to sync out and bypass
map_is_mergeable, so it will also not reduce f2fs_map_blocks calls.

Or am I missing something?

Thanks,
Nanzhe Zhao
_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
