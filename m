Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FC7B04F47
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jul 2025 05:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmSlrdX5ZRacxG8pEIFRaJMm8DENam3bCOAkGjN4Apg=; b=c6zmgtG1WNY5YFubTUMbLBrTof
	7wLfwMIu/648XSa7EIawsOQQ2fh/M0/7fuQZh1Cl6kv8WqjjeRzEzhn0Sh3690S1Q6Q0L+/WoqVMc
	SOuPMdsi7UxPMebbjzQ5Bv0nnxSTvcuU10yVcMH+2f2Opl3AL/9QvjkN82FC6vyXkkYE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubWZs-0006E0-Jq;
	Tue, 15 Jul 2025 03:43:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ubWZr-0006Du-6t
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 03:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZY2H4mg0F4A/+rZfeM0cchN5ctdNc2WvRLPG6mGoQAE=; b=iIVrMH6NjaMhvtTxnvcHw3SCYp
 /SI/QxORTh4aFJNx14IwG0UExVIUA8Yy82Cip/fyfwAsGQ78JZCtn2EgNUgzhKYpAbwyAZxkJFcGh
 zvDMN22z+9WK4XJoMpea5+gflnwGsJL/ScZHxR2ZmTs9MGGFrZqhhIpUJ0XFGkBLmPK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZY2H4mg0F4A/+rZfeM0cchN5ctdNc2WvRLPG6mGoQAE=; b=lP0c67JWzOFM4hrnR9Z7RuaQL4
 BzsOjonnXFOEcbYWhkcPm+mqqQqcBFkZmVPu+wCddsoWrxLTQ7DaTkUEQhRBqRAN+NwdBo+9u/LRQ
 FDiG5LJx88w+hW1lLwKOI1D+VgEwVmL6RNrHfSC5sTh7sEsUK3RPW6fr+9mznTOimsf0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubWZq-0002Jn-R7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 03:43:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1BB77457BB;
 Tue, 15 Jul 2025 02:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E514C4CEF0;
 Tue, 15 Jul 2025 02:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752546460;
 bh=TzTh/P3Lp9jBCanCa+hsjUi7+ZwvfIkv/6TtgEsGlMw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=vC2n/omoiMT0tzn2li8mwXYV+nyXys1HdBBiKKcaiJZ7fFdMNlfdSL6KqRaGXbgMM
 UlzhJuJDo1a7/6iyFtxm5rnXas2r6xaHg8hmteNaplZM3/W3m8sbPiR3knsIm1J4JT
 o5J/l2ifZeR6HY6WUyyyjBdNGMMeR9cwLsxR5xGFKIvpNAVdn3zrZSHW6f6J+G7zbH
 2mhEa8zaIsX109Nei7Ex+rE55JYfO3Ap6FENPRaBH9LfHXf0pZyLq5OoU720pM9tzU
 1CP4KAw86jIntsa0q2B6V8A8jjP+3e2+qZWi1kOGEWfsZoi+q/aG6C3pGTLIJhvkYB
 7fcwy0GnlPWMg==
Message-ID: <959d31dd-3a80-4cc3-ae0f-99de34d8b30b@kernel.org>
Date: Tue, 15 Jul 2025 10:27:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250714175103.61996-1-chullee@google.com>
Content-Language: en-US
In-Reply-To: <20250714175103.61996-1-chullee@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/15/25 01:51, Daniel Lee wrote: > Signed-off-by: Daniel
 Lee <chullee@google.com> Oh, just notice you help to update test_lookup_perf
 entry as well. Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ubWZq-0002Jn-R7
Subject: Re: [f2fs-dev] [PATCH] man: add doc for
 test_create_perf/test_lookup_perf
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/15/25 01:51, Daniel Lee wrote:
> Signed-off-by: Daniel Lee <chullee@google.com>

Oh, just notice you help to update test_lookup_perf entry as well.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
>  man/f2fs_io.8 | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
> index e0f659e..6f3e11e 100644
> --- a/man/f2fs_io.8
> +++ b/man/f2fs_io.8
> @@ -184,6 +184,28 @@ Get i_advise value and info in file
>  .TP
>  \fBioprio\fR \fI[hint] [file]\fR
>  Set ioprio to the file. The ioprio can be ioprio_write.
> +.TP
> +\fBtest_create_perf\fR \fI[-s] [-S] [dir] [num_files] [size_kb]\fR
> +Measure file creation and deletion performance.
> +.RS 1.2in
> +.TP
> +.B -s
> +Call fsync() after each file creation.
> +.TP
> +.B -S
> +Call sync() after deleting all files.
> +.RE
> +.TP
> +\fBtest_lookup_perf\fR \fI[-i] [-v] [dir] [num_files]\fR
> +Measure readdir/stat performance.
> +.RS 1.2in
> +.TP
> +.B -i
> +Initialized to create files only.
> +.TP
> +.B -v
> +Verbose mode.
> +.RE
>  .SH AUTHOR
>  This version of
>  .B f2fs_io



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
