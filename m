Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7287A5D4BF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 04:31:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsCo5-0008PH-1U;
	Wed, 12 Mar 2025 03:30:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tsCnw-0008P3-Q0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 03:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZCqo2vOpN5bfsM8TrSXASjTUvj7UHazRbGNzpUUf/P0=; b=CJm+/E1XkHzPRUV/s8ujMF2Ow2
 eYTKP/s+CyXd98lyy6T+6NZ+n5spVt6EheWQmTQU5rB3DLI2fbE5MRCRkHYJK1cq2YZBU5iS6EQKK
 Ad0mcz0DPFv+jsZk4mxrlPc45ReAnPxxwvtGU+G8zsednT4SPZVBIBjgsbDMJ2dNmrZ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZCqo2vOpN5bfsM8TrSXASjTUvj7UHazRbGNzpUUf/P0=; b=AuBXrWqu4bR68FSaLSbbKrYO7/
 nBnDH0RGJqirNu5luE+3/dC+puRwr4+2fwsgub2A5UUKCsbbkNrUDzUAilWOnD2ZzmZ2qleqtrYp5
 83IIIT+s44/RAAdfBwPnEIePrLaS7bz5SjrIOhzWsadUXxyVofdpecWuRsJFqnyutnL4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsCnw-0007I5-R5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 03:30:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2918DA46CCE;
 Wed, 12 Mar 2025 03:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C22C4CEE3;
 Wed, 12 Mar 2025 03:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741750237;
 bh=BELT6CDxjQ/If9Mrg5ejaES1naMln9mZRDL1yyCMao0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=EKwivp4Bt7WuKaV1xySF+8TMekjw5w0oDEWagcuKZ2vstVd6FpFMFn3C0ZdbH7IdB
 mwmW86IPHjNrtAF/hihVkKUT4RUPKbeksdz68vLFAKEIdSK/kuKqtc/BKbwVarSWfY
 BPLYhib/TuSDGvMHjDoi8RvwP4kvUSoTOkeIDfyuOvGhzE3+xNraQYAfurxMJ1zBHA
 NVwwcTDh6zXTceX1HPHnZHA6EIBxmp/+j+HwEkH6D6DRjw4JsQPvHwIgMoh87Ed8m7
 PiNjkXRL5qzcviQ6QeGVarUbhEbGJxPxnGqxKeTAFaWqGY2avjanzNkxrVuK54tW0U
 xhIAzv0xlTJGw==
Message-ID: <fe455fcc-9feb-4952-b089-2198a586aa1f@kernel.org>
Date: Wed, 12 Mar 2025 11:30:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250303172127.298602-1-sandeen@redhat.com>
 <20250303172127.298602-6-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250303172127.298602-6-sandeen@redhat.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/4/25 01:12, Eric Sandeen wrote: > Set LAZYTIME into sbi
 during parsing, and transfer it to the sb in > fill_super, so that an sb
 is not required during option parsing. > > (Note: While lazytime i [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsCnw-0007I5-R5
Subject: Re: [f2fs-dev] [PATCH 5/9] f2fs: make LAZYTIME a mount option flag
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/4/25 01:12, Eric Sandeen wrote:
> Set LAZYTIME into sbi during parsing, and transfer it to the sb in
> fill_super, so that an sb is not required during option parsing.
> 
> (Note: While lazytime is normally handled via mount flag in the vfs,
> some f2fs users do expect to be able to use it as an explicit mount
> option string via the mount syscall, so this option must remain.)
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
