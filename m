Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F60B3D51C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 Aug 2025 22:12:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEl5Qu9XkKdJNArHdRN1BcEv5UlknIwXwbk/2pAPCLM=; b=bIiGYMtFmW0E8cfeMrRaR4bjOl
	07v3r0ddRYnQoJHqLDgQqNaKmsZdmY83ChO4R1nrxExYkDHUWpDjAmaZGuvSizB5aZn/b0Maxi7DP
	GwvFMlYqwHZZULI7jnnuLg8mzU6619rd+HHo0xMPpEFHSmFRlhVBP6AFAO7btt5tPDSY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1usoPd-0004M7-MA;
	Sun, 31 Aug 2025 20:12:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1usoPb-0004Lz-BO
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 31 Aug 2025 20:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jeNn2yqsZkFs7KvKwIK46ykzytj6cKlzLAe6/krfRos=; b=YCSYPJhcsWX6QW7f/1qDoiLPCW
 UbyOrlaPBQMYKr0xQUKs424OOyjuotIQAGNZeRK48SPGBc57fUGw7fFNLHMTUmq5hVY0tUZCM8iSz
 9zRWQqGzd14w9q/q/2xEXUgbDWXeOUQ8MZqvU5Nx+IyoNWQ/aRwUHUQSPfriGUBL4zhs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jeNn2yqsZkFs7KvKwIK46ykzytj6cKlzLAe6/krfRos=; b=KC+GcqQcdCT8BiOx6/WfIV+L9C
 gAVuCmvJj9ikDCMvnA+wRyWALOsSwmO+ldYyfTKG+LVY/ak2HMWdplJC0D80mQPZO05KMl9Srmb/J
 JPr0XniTTE7zGDRcbmZEHSgJT3tQ5QX2WV/t+1ZgJBg/rUEsTaf3RhBiNraRuBLoFfH0=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1usoPa-0007nO-Uj for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 31 Aug 2025 20:12:27 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5980440B03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1756671136; bh=jeNn2yqsZkFs7KvKwIK46ykzytj6cKlzLAe6/krfRos=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hQ0QL777blvzeEno3CoTZVUU6Ee7DIHX9tJzvFR1RXz04L8I3nX7aEMSGhF3T3jk9
 KG+vJv37GVhjs7wcS+IBFqW54pMjunZNBttfGw+HZRzIB7Exgq52B3P5pDBTc8dqh3
 NFJ7965aDNXw71y9rubHd7ELxRMbdNEUovruhx3MBCf897LuxrktR84JbxdmX1ndkd
 h/ILhvTfG5oo9+OjsIQTrgVbeRdlFfDuxFNswYwl/KN2FxfgY30GYnAZ5uUGFe9tsb
 +4p4Yxb+80IQXQ2Hzx1t5k8X8iDwX418wqfV3xLR+F/4PWd9gdXZaU3S4cNmRtufNt
 2WiwyRjJKzAew==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 5980440B03;
 Sun, 31 Aug 2025 20:12:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jaegeuk Kim <jaegeuk@kernel.org>
In-Reply-To: <aLOPq_zLap9PuMrW@google.com>
References: <20250820043432.22509-1-bagasdotme@gmail.com>
 <87qzwt3glo.fsf@trenco.lwn.net> <aLOPq_zLap9PuMrW@google.com>
Date: Sun, 31 Aug 2025 14:12:15 -0600
Message-ID: <874itn1c9s.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk Kim <jaegeuk@kernel.org> writes: > On 08/29, Jonathan
 Corbet wrote: >> Bagas Sanjaya <bagasdotme@gmail.com> writes: >> >> > Hi,
 >> > >> > Here are documentation formatting cleanup for f2fs. This also
 includes >> > docs retitle at the [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1usoPa-0007nO-Uj
Subject: Re: [f2fs-dev] [PATCH 0/6] f2fs: documentation formatting cleanup
 and improvements
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
Cc: Daeho Jeong <daehojeong@google.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yangtao Li <frank.li@vivo.com>,
 Linux F2FS <linux-f2fs-devel@lists.sourceforge.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Yuanye Ma <yuanye.ma20@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk Kim <jaegeuk@kernel.org> writes:

> On 08/29, Jonathan Corbet wrote:
>> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>> 
>> > Hi,
>> >
>> > Here are documentation formatting cleanup for f2fs. This also includes
>> > docs retitle at the end of series ([6/6]) as a bonus.
>> >
>> > This series is based on docs-next tree.
>> >
>> > Enjoy!
>> >
>> > Bagas Sanjaya (6):
>> >   Documentation: f2fs: Separate errors mode subtable
>> >   Documentation: f2fs: Format compression level subtable
>> >   Documentation: f2fs: Span write hint table section rows
>> >   Documentation: f2fs: Wrap snippets in literal code blocks
>> >   Documentation: f2fs: Indent compression_mode option list
>> >   Documentation: f2fs: Reword title
>> >
>> >  Documentation/filesystems/f2fs.rst | 88 +++++++++++++++++-------------
>> >  1 file changed, 50 insertions(+), 38 deletions(-)
>> 
>> Jaegeuk, are you going to pick this up, or would you like me to?
>
> Hi, I applied them in the f2fs tree, if you don't mind.

Not at all - thanks for letting me know!

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
