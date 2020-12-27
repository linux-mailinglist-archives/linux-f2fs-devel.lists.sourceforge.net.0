Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A602E3153
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Dec 2020 14:44:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ktWKz-0004q2-VR; Sun, 27 Dec 2020 13:43:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmenzel@molgen.mpg.de>) id 1ktWKu-0004pk-Ni
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 27 Dec 2020 13:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bvUON/Nd2XSEwFI9ZSE/PE/teUEUMMpkUzIAJOnNZsc=; b=OB0shFE76enoJQuNiAYXmE6oIR
 LJ+GyWjbQZzhp01qiyysjUBkclGXT9oxZt2ngXoctZOWSSbC38CUmMCuwd/Y2ONzwWPF6KUdnk3aa
 Qtez3vuxsqqoeippfdoqcB7zqlSq4EPkfVPP2EizHQ3exqW/JBCjsX+eboXIWQ4C2MFg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:Cc:To:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bvUON/Nd2XSEwFI9ZSE/PE/teUEUMMpkUzIAJOnNZsc=; b=h
 cxYJl1JLSIdbdu9m8bXdlkDk8L1iMh1/WP31uQBiKa4aLD2hr+2yTDWrVqZCXfGjgqvmBkIARjq6U
 JYxibeUwWg8G/TLJq1R4V0aUVsF+umSGL2JrsvxbJclaEla72T5UQgqZjdFAJi5CgGMrNRQ15y4bo
 6lTgWHpJEYucwmEs=;
Received: from mx3.molgen.mpg.de ([141.14.17.11] helo=mx1.molgen.mpg.de)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ktWKk-00HRO4-48
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 27 Dec 2020 13:43:52 +0000
Received: from [192.168.1.11]
 (dynamic-077-013-243-215.77.13.pool.telefonica.de [77.13.243.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id D2B0120225BD3;
 Sun, 27 Dec 2020 14:27:12 +0100 (CET)
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <96184c8e-6ea3-caa7-ba2b-b5644b70b2a9@molgen.mpg.de>
Date: Sun, 27 Dec 2020 14:27:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1ktWKk-00HRO4-48
Subject: [f2fs-dev] 120 s delay during boot with smaller initrd
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
Cc: LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RGVhciBMaW51eCBmb2xrcywKCgpVc2luZyBhbiBpbml0cmQgY3JlYXRlZCBieSB0aW55LWluaXRy
YW1mcyBbMV0sIHRoZSBib290IHN0YWxscyBmb3IgdHdvIAptaW51dGVzICphZnRlciogdGhlIGlu
aXRyZCBoYXMgcnVuIGFuZCBzeXN0ZW1kIGhhcyBhbHJlYWR5IHN0YXJ0ZWQuIEFuIApGMkZTIHJv
b3QgcGFydGl0aW9uIGlzIHVzZWQuCgpgYGAKWyAgICAwLjAwMDAwMF0gbWljcm9jb2RlOiBtaWNy
b2NvZGUgdXBkYXRlZCBlYXJseSB0byByZXZpc2lvbiAweGEwYiwgCmRhdGUgPSAyMDEwLTA5LTI4
ClsgICAgMC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNS45LjAtNS1hbWQ2NCAKKGRlYmlhbi1rZXJu
ZWxAbGlzdHMuZGViaWFuLm9yZykgKGdjYy0xMCAoRGViaWFuIDEwLjIuMS0xKSAxMC4yLjEgCjIw
MjAxMjA3LCBHTlUgbGQgKEdOVSBCaW51dGlscyBmb3IgRGViaWFuKSAyLjM1LjEpICMxIFNNUCBE
ZWJpYW4gCjUuOS4xNS0xICgyMDIwLTEyLTE3KQpbICAgIDAuMDAwMDAwXSBDb21tYW5kIGxpbmU6
IEJPT1RfSU1BR0U9L2Jvb3Qvdm1saW51ei01LjkuMC01LWFtZDY0IApyb290PS9kZXYvc2RhMiBy
byBxdWlldCBub2lzYXBucCBjcnlwdG9tZ3Iubm90ZXN0cyByYW5kb20udHJ1c3RfY3B1PW9uIAp0
c2M9dW5zdGFibGUgZGVidWcgbG9nX2J1Zl9sZW49Mk0gaW5pdGNhbGxfZGVidWcKW+KApl0KWyAg
ICAwLjY1MDE2OF0gVHJ5aW5nIHRvIHVucGFjayByb290ZnMgaW1hZ2UgYXMgaW5pdHJhbWZzLi4u
ClsgICAgMC42NjEzNDNdIEZyZWVpbmcgaW5pdHJkIG1lbW9yeTogMTAyNEsKW+KApl0KWyAgICA2
LjAzMzA0NF0gc3lzdGVtZFsxXTogc3lzdGVtZCAyNDcuMi0zIHJ1bm5pbmcgaW4gc3lzdGVtIG1v
ZGUuICgrUEFNIAorQVVESVQgK1NFTElOVVggK0lNQSArQVBQQVJNT1IgK1NNQUNLICtTWVNWSU5J
VCArVVRNUCArTElCQ1JZUFRTRVRVUCAKK0dDUllQVCArR05VVExTICtBQ0wgK1haICtMWjQgK1pT
VEQgK1NFQ0NPTVAgK0JMS0lEICtFTEZVVElMUyArS01PRCAKK0lETjIgLUlETiArUENSRTIgZGVm
YXVsdC1oaWVyYXJjaHk9dW5pZmllZCkKW+KApl0KWyAgICA5LjM3MjEzNF0gZnVzZTogaW5pdCAo
QVBJIHZlcnNpb24gNy4zMSkKWyAgICA5LjM5Njk5MF0gY2FsbGluZyAgcGtjczhfa2V5X2luaXQr
MHgwLzB4MTAwMCBbcGtjczhfa2V5X3BhcnNlcl0gQCAxMTQKWyAgICA5LjQxMzk1Nl0gQXN5bW1l
dHJpYyBrZXkgcGFyc2VyICdwa2NzOCcgcmVnaXN0ZXJlZApbICAgIDkuNDIxMzc4XSBpbml0Y2Fs
bCBwa2NzOF9rZXlfaW5pdCsweDAvMHgxMDAwIFtwa2NzOF9rZXlfcGFyc2VyXSAKcmV0dXJuZWQg
MCBhZnRlciAxNTkxMiB1c2VjcwpbICAgIDkuNDMzOTg5XSBpbml0Y2FsbCBmdXNlX2luaXQrMHgw
LzB4MTQyIFtmdXNlXSByZXR1cm5lZCAwIGFmdGVyIAoyODIwNiB1c2VjcwpbICAgIDkuNDQzMjI5
XSBjYWxsaW5nICBkcm1fY29yZV9pbml0KzB4MC8weDEwMDAgW2RybV0gQCAxMTAKWyAgICA5LjQ4
MDc0MF0gaW5pdGNhbGwgZHJtX2NvcmVfaW5pdCsweDAvMHgxMDAwIFtkcm1dIHJldHVybmVkIDAg
YWZ0ZXIgCjI4ODg4IHVzZWNzClsgICAxMi4wNTc0NTZdIHJhbmRvbTogY3JuZyBpbml0IGRvbmUK
WyAgIDEyLjA2MDgxMV0gcmFuZG9tOiA3IHVyYW5kb20gd2FybmluZyhzKSBtaXNzZWQgZHVlIHRv
IHJhdGVsaW1pdGluZwpbICAxMzUuODcxOTg4XSBwZXJmOiBpbnRlcnJ1cHQgdG9vayB0b28gbG9u
ZyAoMjUwOSA+IDI1MDApLCBsb3dlcmluZyAKa2VybmVsLnBlcmZfZXZlbnRfbWF4X3NhbXBsZV9y
YXRlIHRvIDc5NTAwClsgIDE0MC4yODYxNTddIGF1ZGl0OiB0eXBlPTE0MDAgYXVkaXQoMTYwOTA2
NDc4OC4wMTI6Mik6IAphcHBhcm1vcj0iU1RBVFVTIiBvcGVyYXRpb249InByb2ZpbGVfbG9hZCIg
cHJvZmlsZT0idW5jb25maW5lZCIgCm5hbWU9Im52aWRpYV9tb2Rwcm9iZSIgcGlkPTE0MiBjb21t
PSJhcHBhcm1vcl9wYXJzZXIiClsgIDE0MC4zMTUxNTJdIGF1ZGl0OiB0eXBlPTE0MDAgYXVkaXQo
MTYwOTA2NDc4OC4wMTI6Myk6IAphcHBhcm1vcj0iU1RBVFVTIiBvcGVyYXRpb249InByb2ZpbGVf
bG9hZCIgcHJvZmlsZT0idW5jb25maW5lZCIgCm5hbWU9Im52aWRpYV9tb2Rwcm9iZS8va21vZCIg
cGlkPTE0MiBjb21tPSJhcHBhcm1vcl9wYXJzZXIiClsgIDE0MC4zNDg2MjNdIGF1ZGl0OiB0eXBl
PTE0MDAgYXVkaXQoMTYwOTA2NDc4OC4wNzI6NCk6IAphcHBhcm1vcj0iU1RBVFVTIiBvcGVyYXRp
b249InByb2ZpbGVfbG9hZCIgcHJvZmlsZT0idW5jb25maW5lZCIgCm5hbWU9Ii91c3IvYmluL21h
biIgcGlkPTE1NSBjb21tPSJhcHBhcm1vcl9wYXJzZXIiClsgIDE0MC4zODI3NDRdIGF1ZGl0OiB0
eXBlPTE0MDAgYXVkaXQoMTYwOTA2NDc4OC4wNzI6NSk6IAphcHBhcm1vcj0iU1RBVFVTIiBvcGVy
YXRpb249InByb2ZpbGVfbG9hZCIgcHJvZmlsZT0idW5jb25maW5lZCIgCm5hbWU9Im1hbl9maWx0
ZXIiIHBpZD0xNTUgY29tbT0iYXBwYXJtb3JfcGFyc2VyIgpbICAxNDAuNDA4NzkxXSBhdWRpdDog
dHlwZT0xNDAwIGF1ZGl0KDE2MDkwNjQ3ODguMDcyOjYpOiAKYXBwYXJtb3I9IlNUQVRVUyIgb3Bl
cmF0aW9uPSJwcm9maWxlX2xvYWQiIHByb2ZpbGU9InVuY29uZmluZWQiIApuYW1lPSJtYW5fZ3Jv
ZmYiIHBpZD0xNTUgY29tbT0iYXBwYXJtb3JfcGFyc2VyIgpbICAxNDAuNDM5ODYwXSBhdWRpdDog
dHlwZT0xNDAwIGF1ZGl0KDE2MDkwNjQ3ODguMDcyOjcpOiAKYXBwYXJtb3I9IlNUQVRVUyIgb3Bl
cmF0aW9uPSJwcm9maWxlX2xvYWQiIHByb2ZpbGU9InVuY29uZmluZWQiIApuYW1lPSIvdXNyL2xp
Yi9jdXBzL2JhY2tlbmQvY3Vwcy1wZGYiIHBpZD0xNDEgY29tbT0iYXBwYXJtb3JfcGFyc2VyIiAK
ClsgIDE0MC40ODE1MjFdIGNhbGxpbmcgIGFjcGlfY3B1ZnJlcV9pbml0KzB4MC8weDEwMDAgW2Fj
cGlfY3B1ZnJlcV0gQCAxNTQKW+KApl0KYGBgCgpUaGUgdXNlcnNwYWNlIGxvZyBkdXJpbmcgdGhh
dCB0aW1lIGNvdWxkIGJlOgoKYGBgCkRleiAyNyAxMToyNDoxNyBzaXRvcGFuYWtpIHN5c3RlbWRb
MV06IEZpbmlzaGVkIENvbGRwbHVnIEFsbCB1ZGV2IERldmljZXMuCkRleiAyNyAxMToyNDoxNyBz
aXRvcGFuYWtpIHN5c3RlbWRbMV06IHN5c3RlbWQtdWRldi10cmlnZ2VyLnNlcnZpY2U6IApDb250
cm9sIGdyb3VwIGlzIGVtcHR5LgpEZXogMjcgMTE6MjQ6MTcgc2l0b3BhbmFraSBzeXN0ZW1kWzFd
OiBzeXNpbml0LnRhcmdldDogc3RhcnRpbmcgaGVsZCAKYmFjaywgd2FpdGluZyBmb3I6IHN5c3Rl
bWQtaHdkYi11cGRhdGUuc2VydmljZQpEZXogMjcgMTE6MjY6MDIgc2l0b3BhbmFraSBzeXN0ZW1k
WzFdOiBzeXN0ZW1kLWpvdXJuYWxkLnNlcnZpY2U6IEdvdCAKbm90aWZpY2F0aW9uIG1lc3NhZ2Ug
ZnJvbSBQSUQgMTEzIChXQVRDSERPRz0xKQpEZXogMjcgMTE6MjY6Mjcgc2l0b3BhbmFraSBzeXN0
ZW1kLWZzY2tbMTE5XTogSW5mbzogRml4IHRoZSByZXBvcnRlZCAKY29ycnVwdGlvbi4KRGV6IDI3
IDExOjI2OjI3IHNpdG9wYW5ha2kgc3lzdGVtZC1mc2NrWzExOV06IEluZm86IE1vdW50ZWQgZGV2
aWNlIQpEZXogMjcgMTE6MjY6Mjcgc2l0b3BhbmFraSBzeXN0ZW1kLWZzY2tbMTE5XTogSW5mbzog
Q2hlY2sgRlMgb25seSBkdWUgdG8gUk8KYGBgCgpBcyBpdCBkb2VzIG5vdCBoYXBwZW4gd2l0aCB0
aGUgaW5pdHJkIGNyZWF0ZWQgYnkgaW5pdHJhbWZzLXRvb2xzLCBidXQgCnRoZSBpbml0cmQgd2Fz
IHN1Y2Nlc3NmdWxseSBydW4sIEkgYW0gcXVpdGUgY29uZnVzZWQuIENvdWxkIGl0IGJlIEYyRlMg
CnJlbGF0ZWQ/IFBsZWFzZSBmaW5kIHRoZSBmdWxsIGxvZ3Mgb2YgYm90aCBzdGFydHMgYXR0YWNo
ZWQgdG8gYnVnIAojMjEwOTE3IFsyXS4KCgpLaW5kIHJlZ2FyZHMsCgpQYXVsCgoKWzFdOiBodHRw
czovL2dpdGh1Yi5jb20vY2hyaXMtc2UvdGlueS1pbml0cmFtZnMvClsyXTogaHR0cHM6Ly9idWd6
aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTA5MTcKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
